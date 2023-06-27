
local parameters = ...				local p = parameters			local file = p.File

p.tweenRate = p.tweenRate * 1.625

if p.SpinSprite == true then p.SpinSprite = 720 end
local spinSprite = p.SpinSprite

local spriteRotation = tapLua.Vector.toCoords( p.Rotation )
local mainRotation = p.mainRotation or 0

local pos = { 10, - 590 }		-- Z coord positions values.
if p.Move == "Out" then pos = { pos[2], pos[1] } end

local shade = p.Shade

local defaultSlices = 9
if file:match("/5th/") then defaultSlices = 6 end

local slices = p.Slices or defaultSlices		
slices = math.floor( slices + 1 )

local waves = p.Waves or 3						
waves = math.floor( waves )

if p.Type == "Whirl" then 
	slices = 25		waves = 1		p.tweenRate = p.tweenRate * 4 
end

local increment = 360 / slices

-- Starting and last angle, radial direction forwards by default.
local angleData = { 0, 0, direction = - 1 }
angleData[2] = math.ceil( 360 * waves - increment )

if p.Skip then
	local states = p.States
	local statesNumber = states[2] - states[1]
	local extra = ( angleData[2] / increment ) % statesNumber
	angleData[2] = angleData[2] + extra * increment
end

if p.Clockwise then angleData.direction = 1 end

if p.StaticAngle then 
	spinSprite = 360 * angleData.direction
	spriteRotation = spriteRotation or { x = 0, y = 0, z = 0 }
end

-- Loop expression
local loop = { angleData[1], angleData[2], increment }

local t = beat4sprite.ActorFrame() .. { OnCommand=function(self)
	self:zbuffer(true):SortByDrawOrder():fov(170)
end }

local function wait( self, angle )
	return angle * self:getTweenRate() / ( math.abs( loop[3] ) * slices )
end

local function fadeTime(self) 
	if p.Type == "Whirl" then return self:getTweenRate() * 0.0625 end
	return self:getTweenRate() * 0.125 end

local function wait2(self)
	if p.Type == "Whirl" then return self:getTweenRate() * waves * 0.825 end 
	return self:getTweenRate() * ( waves - 1 ) * 1.4
end

local function totalTime(self) return fadeTime(self) * 2 + wait2(self) end

local index = 0

for angle = loop[1], loop[2], loop[3] do

	local fadeFrame = beat4sprite.ActorFrame() .. {

		OnCommand=function(self)

			self.Parameters = p

			self:diffusealpha(0):sleep( wait(self, angle) ):queuecommand("Broadcast")

		end,

		BroadcastCommand=function(self)

			local parent = self:GetParent():GetParent():GetParent()
			if p:hasCommand("Shade") then parent:queuecommand("Shade") end

			self:queuecommand("Repeat"):queuecommand("Fade")

		end,
		
		FadeCommand=function(self)
			-- if angle == loop[1] then self:diffuse(Color.Red) end
			self:linear( fadeTime(self) ):diffusealpha(1):sleep( wait2(self) )
			self:linear( fadeTime(self) ):diffusealpha(0)
			self:queuecommand("Fade")
		end
	
	}

	-- 4 frames :) ( Shade, Main Rotation Frame, Position Frame, Fade, Sprite )

	t[#t+1] = beat4sprite.ActorFrame() .. {
		
		ShadeCommand=function(self)

			local time = totalTime( self:GetParent() )
			self:diffuse( shade[1] ):linear(time):diffuse( shade[2] ):queuecommand("Shade")
		
		end,

		beat4sprite.ActorFrame() .. {
			
			OnCommand=function(self) self:Center():rotationz( mainRotation ) end,

			beat4sprite.ActorFrame() .. { fadeFrame }

		}

	}

	local a = t[#t][1][1][1]

	a[1] = beat4sprite.Actor(p) .. {

		OnCommand=function(self)

			self.PositionFrame = self:GetParent():GetParent()
			self.MainRotationFrame = self.PositionFrame:GetParent()

			self:init():rotationz( angle * angleData.direction + 90 )

			if p.Zoom then self:zoom( self:GetZoom() * p.Zoom ) end
			if p.Color then self:diffuse( p.Color[1] ) end		-- [1] because of Value.lua onColors()
			if p.Blend then self:blend( p.Blend ) end
			
			self:playCommands()

			local r = spriteRotation
			if r then self:rotationx(r.x):rotationy(r.y):rotationz(r.z) end

		end,

		StatePerSpriteCommand=function(self)
			
			if p.Skip then

				local i = angle / loop[3]			i = math.abs(i) + 1
				i = i % ( p.States[2] + 2 )

				-- If it's not first, last angle and the spot is the one that should skip. 
				local shouldSkip = angle == loop[2] or angle == 0 or i == 1

				if shouldSkip then self:visible(false)		index = index + 1 end

			end

			local a = p.Clockwise and self:GetNumStates() or 0
			local s = ( angle + loop[3] ) / loop[3] - index - 1 - a

			self:setstate( self:roundState(s) )

			if not p.Clockwise then self:rotationz( self:GetRotationZ() + 180 ) end

		end,

		SpinCommand=function(self)

			local p = self.MainRotationFrame			local rotation = p:GetRotationZ()
			p:linear( totalTime(self) ):rotationz( rotation - 360 * angleData.direction )

			if not spinSprite then return end

			local rotation = self:GetRotationZ()
			self:linear( totalTime(self) ):rotationz( rotation + spinSprite )

		end,

		RepeatCommand=function(self)

			local parent = self.PositionFrame
			local h = self:GetZoomedHeight() * 1.5

			local direction = {
				x = math.cos( math.rad(angle) ),
				y = math.sin( math.rad(angle) ) * angleData.direction
			}

			if p.Type == "Spiral" then self:queuecommand("Spin") end
			if p.Type == "Whirl" then h = h * 2 end

			parent:xy( h * direction.x, h * direction.y )

			parent:z( pos[1] ):linear( totalTime(self) ):z( pos[2] )
			if p.Type == "Whirl" then parent:xy(0,0) end

			parent:queuecommand("NextState"):queuecommand("Repeat")

		end,

		NextStateCommand=function(self)
			if p.Skip then return end
			self:setstate( self:roundState( self:GetState() + 1 ) )
		end

	}

end

return t