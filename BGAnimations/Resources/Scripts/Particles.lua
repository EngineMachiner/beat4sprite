

local params = ...
local p = params

local sprites = p.File

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:fov(120)
		self:zbuffer(true)
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end	
}

p.Alpha = p.Alpha or 1

BGA_G.DefPar( p )

local num = p.Num or 18

local ang = { -360, 360 }

if not p.Spin then 
	ang[1] = 0
	ang[2] = 0
end

local comd = "MoveY"
if p.Dir == "Left" 
or p.Dir == "Right" then
	comd = "MoveX"
end

p.Dir = p.Dir or "Down"

for i=1,num do	

	local a = Def.ActorFrame{
		GainFocusCommand=function(self)
			BGA_G.Stop( self, true )
		end,
		LoseFocusCommand=function(self)
			BGA_G.Stop( self )
		end
	}

	-- Rainbow Pattern AF
	t[#t+1] = Def.ActorFrame{ a }

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

			if p.Shade then
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

			BGA_G.SetStates(self, p)
			BGA_G.PlayCmds(self, p)

			if BGA_G.IsCmd( p, "Rainbow" )
			or p.Color == "Rainbow" then

				if p.RainbowPattern == 2 then
					self:GetParent():GetParent():SetUpdateFunction(function(af)

						local d = self:GetEffectDelta()
						af.clock = af.clock and af.clock + d or 0

						if af.clock > 1 then
							local n = {}
							for i=1,3 do
								n[i] = math.random(0,1000) * 0.001
								n[i] = tostring(n[i]) .. ","
							end
							af:diffuse(color(n[1]..n[2]..n[3].."1"))
							af.clock = 0
						end

					end)
				else
					self:rainbow()
					self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
				end
				
			end

			local d = BGA_G.GetDelay(self)[2]
			self:sleep( i * 0.5 * d )
			self:diffusealpha(1)	

			if BGA_G.IsCmd( p, "Color" )
			and type(p.Color) == "table" then
				self:diffuse(p.Color)
			end

			if BGA_G.IsCmd( p, "Alpha" ) then
				self:diffusealpha( p.Alpha )
			end

			if BGA_G.IsCmd( p, "Blend" ) then
				p.Blend = p.Blend or "BlendMode_Modulate"
				self:blend( p.Blend )
			end

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
			if BGA_G.IsCmd( p, "Alpha" ) then
				self:diffusealpha( p.Alpha )
			end
			self:queuecommand(comd)
		end,

		MoveXCommand=function(self)

			local w = self:GetZoomedWidth() * 0.5
			local h = self:GetZoomedHeight() * 0.5
			local d = self.d
			local d_2 = BGA_G.GetDelay(self)[2]

			local Dirs = {}

			local p2 = w + d
			Dirs.Right = {}
			a = Dirs.Right
			a[1] = SCREEN_LEFT - p2
			a[2] = SCREEN_RIGHT + p2

			Dirs.Left = {}
			a = Dirs.Left
			a[1] = Dirs.Right[2]
			a[2] = Dirs.Right[1]

			self:rotationz(0)

			d = d * 0.5
			p2 = h - d
			self:y( math.random( p2, _screen.h - p2 ) )
			self:x( Dirs[p.Dir][1] )

			p2 = math.random( 400, 700 )
			p2 = p2 * 0.01
			self:linear( p2 * d_2 )

			self:rotationz( ang[math.random(1,2)] )
			self:x( Dirs[p.Dir][2] )

			self:queuecommand("Sleep")

		end,

		MoveYCommand=function(self)

			local w = self:GetZoomedWidth() * 0.5
			local h = self:GetZoomedHeight() * 0.5
			local d = self.d
			local d_2 = BGA_G.GetDelay(self)[2]

			local Dirs = {}

			local p2 = h + d
			Dirs.Up = {}
			local a = Dirs.Up
			Dirs.Up[1] = SCREEN_BOTTOM + p2 * 1.25
			Dirs.Up[2] = SCREEN_TOP - p2 * 1.25

			Dirs.Down = {}
			local a = Dirs.Down
			a[1] = Dirs.Up[2]
			a[2] = Dirs.Up[1]
	
			self:rotationz(0)

			d = d * 2
			p2 = h - d
			self:x( math.random( p2, _screen.h - p2 ) )
			self:y( Dirs[p.Dir][1] )

			p2 = math.random( 400, 700 )
			p2 = p2 * 0.01
			self:linear( p2 * d_2 )

			self:rotationz( ang[math.random(1,2)] )
			self:y( Dirs[p.Dir][2] )

			self:queuecommand("Sleep")

		end

	}

end

if p.Remove then
	t = nil
end

return Def.ActorFrame{ t }