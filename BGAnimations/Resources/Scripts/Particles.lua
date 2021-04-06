

local params = ...
local sprites = params.File

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:fov(120):zbuffer(true)
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end	
}

params.Alpha = params.Alpha or 1

BGA_G.DefPar( params )

local num = 9*2

local ang = { -360, 360 }

if not params.Spin then 
	ang[1] = 0
	ang[2] = 0
end

local comd = "MoveY"
if params.Dir == "Left" 
or params.Dir == "Right" then
	comd = "MoveX"
end

params.Dir = params.Dir or "Down"

for i=1,num do	

	t[#t+1] = Def.ActorFrame{
		GainFocusCommand=function(self)
			BGA_G.Stop( self, true )
		end,
		LoseFocusCommand=function(self)
			BGA_G.Stop( self )
		end
	}

	local a = t[#t]

	a[#a+1] = Def.Sprite{

		InitCommand=function(self)
			if type(sprites) == "table" then 
				self:Load(sprites[math.random(1,#sprites)])
			else
				self:Load(sprites)
			end
		end,

		OnCommand=function(self)

			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")

			local scale = _screen.h / 480
			local z = math.random( -500, 0 ) * scale
			local col = 1 + z * 0.001 * 1.25 * 0.75
			col = tostring(col)

			if params.Shade then
				local s = col .. ","
				for i=1,2 do
					s = s .. s
				end
				s = s .. "1"
				self:diffuse( color(s) )
			end		

			self:diffusealpha(0)
			self:z( z * scale )

			local d = math.abs( self:GetZ() )
			d = d * scale * 2
			self.d = d

			local n = self:GetNumStates()
			if n > 1 then
				n = math.random( 0, ( n - 1 ) )
				self:setstate( n )
			end

			BGA_G.SetStates(self, params)
			BGA_G.PlayCmds(self, params)

			local d = BGA_G.GetDelay(self)[2]
			self:sleep( i * 0.5 * d )
			self:diffusealpha(1)
			self:queuecommand(comd)

		end,

		TwoSpritesCommand=function(self)
			self:animate(false)
			local n = self:GetNumStates()
			self:setstate(i % n)
		end,

		SleepCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:diffusealpha(0)
			self:sleep(2*d)
			self:diffusealpha(1)
			self:queuecommand(comd)
		end,

		MoveXCommand=function(self)

			local w = self:GetZoomedWidth() * 0.5
			local h = self:GetZoomedHeight() * 0.5
			local d = self.d
			local d_2 = BGA_G.GetDelay(self)[2]

			local Dirs = {}

			local p = w + d
			Dirs.Right = {}
			a = Dirs.Right
			a[1] = SCREEN_LEFT - p
			a[2] = SCREEN_RIGHT + p

			Dirs.Left = {}
			a = Dirs.Left
			a[1] = Dirs.Right[2]
			a[2] = Dirs.Right[1]

			self:rotationz(0)

			d = d * 0.5
			p = h - d
			self:y( math.random( p, _screen.h - p ) )
			self:x( Dirs[params.Dir][1] )

			p = math.random( 400, 700 )
			p = p * 0.01 * 0.5
			self:linear( p * d_2 )

			self:rotationz( ang[math.random(1,2)] )
			self:x( Dirs[params.Dir][2] )

			self:queuecommand("Sleep")

		end,

		MoveYCommand=function(self)

			local w = self:GetZoomedWidth() * 0.5
			local h = self:GetZoomedHeight() * 0.5
			local d = self.d
			local d_2 = BGA_G.GetDelay(self)[2]

			local Dirs = {}

			local p = h + d
			Dirs.Up = {}
			local a = Dirs.Up
			Dirs.Up[1] = SCREEN_BOTTOM + p * 1.25
			Dirs.Up[2] = SCREEN_TOP - p * 1.25

			Dirs.Down = {}
			local a = Dirs.Down
			a[1] = Dirs.Up[2]
			a[2] = Dirs.Up[1]
	
			self:rotationz(0)

			d = d * 2
			p = h - d
			self:x( math.random( p, _screen.h - p ) )
			self:y( Dirs[params.Dir][1] )

			p = math.random( 400, 700 )
			p = p * 0.01 * 0.5
			self:linear( p * d_2 )

			self:rotationz( ang[math.random(1,2)] )
			self:y( Dirs[params.Dir][2] )

			self:queuecommand("Sleep")

		end

	}

end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }