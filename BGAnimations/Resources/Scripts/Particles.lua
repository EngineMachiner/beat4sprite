
-- TO REDO AS RADIAL

local params = ...
local p = params

local t = BGA_G.Frame()
t.OnCommand=function(self)
	self:fov(120)
	self:zbuffer(true)
end

p.Alpha = p.Alpha or 1

local num = p.Num or 18
local ang = p.Spin and { -360, 360 } or { 0, 0 }

local comd = "MoveY"
if p.Dir == "Left" or p.Dir == "Right" then
	comd = "MoveX"
end

p.Dir = p.Dir or "Down"

for i=1,num do	

	local a = BGA_G.Frame()		t[#t+1] = a

	a[#a+1] = Def.Sprite{

		InitCommand=function(self)
			local files = p.File
			if type(p.File) == "string" then 
				files = { files }
			end
			local file = math.random( 1, #files )
			file = files[file]
			self:Load(file)
		end,

		OnCommand=function(self)

			local scale = _screen.h / 480
			local z = math.random( -500, 0 ) * scale
			local col = 1 + z * 0.001 * 1.25 * 0.75
			col = tostring(col)

			if p.Shade then
				local s = col .. ","
				for i=1,2 do s = s .. s end
				self:diffuse( color(s .. "1") )
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

			BGA_G.ObjFuncs(self)
			self:SetStates(p)
			self:PlayCmds(p)

			if p:IsCmd( "Rainbow" ) then
				self:rainbow()
				self:effectperiod( 16 * self:GetDelay(2) )
			end

			local d = self:GetDelay(2)
			self:sleep( i * 0.5 * d )
			self:diffusealpha(1)	

			if p:IsCmd( "Color" ) then
				self:diffuse(p.Color[1])
			end

			if p:IsCmd( "Alpha" ) then
				self:diffusealpha( p.Alpha )
			end

			if p:IsCmd( "Blend" ) then
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
			local d = self:GetDelay(2)
			self:diffusealpha(0)
			self:sleep(2*d)
			self:diffusealpha(1)
			if p:IsCmd( "Alpha" ) then
				self:diffusealpha( p.Alpha )
			end
			self:queuecommand(comd)
		end,

		MoveXCommand=function(self)

			local w = self:GetZoomedWidth() * 0.5
			local h = self:GetZoomedHeight() * 0.5
			local d = self.d
			local d_2 = self:GetDelay(2)

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
			local d_2 = self:GetDelay(2)

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

t = not p.Remove and t

return Def.ActorFrame{ t }