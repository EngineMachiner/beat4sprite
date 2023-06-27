
local parameters = ...		local p = parameters

local fov, file = 150, p.File		local numberOf = p.numberOf or 12

local shade, magnitude = p.Shade, p.EffectMagnitude or { x = 0, y = 0, z = 0 }

local z = { - 600, 0 }
if p.Move == "In" then z = { z[2], z[1] } end

if file:match("1st/") then numberOf = numberOf * 2		fov = 170 end

local t = beat4sprite.ActorFrame() .. { OnCommand=function(self)
	self:fov(fov):zbuffer(true)
end }

local function fadeTime(self) return self:getTweenRate() * 0.5 end

local function wait(self) return self:getTweenRate() * 4 end

local function totalTime(self) return fadeTime(self) * 2 + wait(self) end

for i = 1, numberOf do

	t[#t+1] = beat4sprite.ActorFrame() .. {

		OnCommand=function(self)

			local time = ( i - 1 ) * self:getTweenRate() * 6 / numberOf

			self.Parameters = p
			self:sleep( time ):queuecommand("Broadcast")

		end,

		BroadcastCommand=function(self)
			if p:hasCommand("Shade") then self:queuecommand("Shade") end
			self:queuecommand("Repeat")
		end,

		RepeatCommand=function(self)
			self:z( z[1] ):linear( totalTime(self) ):z( z[2] )
			self:queuecommand("Repeat")
		end,

		beat4sprite.ActorFrame() .. { ShadeCommand=function(self)
			local time = totalTime( self:GetParent() )
			self:diffuse( shade[1] ):linear(time):diffuse( shade[2] )
			self:queuecommand("Shade")
		end }

	}

	local a = t[#t][1]
	
	a[#a+1] = beat4sprite.ActorFrame() .. {

		OnCommand=function(self) self:diffusealpha(0)	self.Parameters = p end,
		RepeatCommand=function(self)
			self:stoptweening():queuecommand("Bump")
			self:linear( fadeTime(self) ):diffusealpha(1)
			self:sleep( wait(self) ):linear( fadeTime(self) ):diffusealpha(0)
		end,

		beat4sprite.Actor(p) .. {

			Texture=file,
			OnCommand=function(self)

				self:init():playCommands()

				-- Random starting state by default
				self:setstate( math.random( 0, self:GetNumStates() - 1 ) )

			end,

			BumpCommand=function(self)

				local w, h = self:GetZoomedWidth() * 0.5, self:GetZoomedHeight()

				local x = { - SCREEN_WIDTH * 0.5, SCREEN_WIDTH * 1.5 }
				self:xy( math.random( x[1], x[2] ), SCREEN_HEIGHT - h )

				local h2 = - h * 1.5 - ( i * 10 )
				h2 = h2 - math.random( 100, 1000 ) * 0.1
				h2 = h2 + magnitude.y

				local offset = ( i - 1 ) * 2 / numberOf
				local period = self:getEffectRate() * 1.25

				if file:match("/Resources/1st/") then
					h2 = h2 * 2			offset = offset * 2			period = period * 2
				end

				self:bounce():effectmagnitude( magnitude.x, h2, magnitude.z )
				self:effectperiod(period):effectoffset(offset)
				
			end

		}

	}

end

return t