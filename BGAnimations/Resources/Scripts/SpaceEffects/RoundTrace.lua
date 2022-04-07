
-- This script is the example to just let each object control
-- their own tween schedule if you don't want issues on replay or desync
-- (ActorFrame with the same sleep as the Sprite)
-- No idea if that's a bug or not

local params = ...

local t = BGA_G.Frame() .. {
	OnCommand=function(self)
		BGA_G.ObjFuncs(self)
		self:Center3D()
	end,
	Def.ActorFrame{
		OnCommand=function(self)
			self:zbuffer(true)
			self:SortByDrawOrder()
			self:fov(170)
		end
	}
}

if params.SprtSpin == true then 
	params.SprtSpin = 720
end

params.Dir = params.Dir == "Out" and { -590, 10 } 
params.Dir = params.Dir or { 10, -590 }

if params.File:match("/5th/") then
	params.Slices = params.Slices or 6
end
params.Slices = params.Slices or 9
params.Waves = params.Waves or 3

params.Waves = math.floor( params.Waves )
params.Slices = math.floor( params.Slices + 1 )

if params.Type == "Whirl" then
	params.Slices = 15	params.Waves = 1
end

local ang = 360 / params.Slices

local cw = 1
local val1 = math.ceil( 360 * params.Waves - ang )
local loop = { 0, val1, ang }
if params.Clockwise then 
	cw = -1		loop = { val1, 0, -ang }
end

if params.StaticAngle then
	params.InitRot = params.InitRot or { 0, 0, 0 }
	params.SprtSpin = 360 * cw
end

local offset = 14
for i = 1, params.Slices do offset = offset - 2 end

-- FramePerSprite empty space state skipping
local skip_i = loop[1]

local tweenT = 4
local fadeT = 0.25

for i = loop[1], loop[2], loop[3] do

	local a = t[#t]

	a[#a+1] = Def.ActorFrame{
		OnCommand=function(self)
			-- Frame offset angle
			if params.Type == "Spiral"
			and params.AngleOffset then
				self:rotationz(params.AngleOffset)
			end
		end,
		Def.ActorFrame{ Def.ActorFrame{
			OnCommand=function(self)
				BGA_G.ObjFuncs(self)
				self:diffusealpha(0)
				local s = i * tweenT
				s = s / ( math.abs(loop[3]) * params.Slices )
				self:sleep( s * self:GetFullDelay(params) )
				self:queuecommand("Fade")
			end,
			FadeCommand=function(self)
				local d = self:GetFullDelay(params) * tweenT
				local t = d * ( params.Waves - 1 ) * 1.25
				self:linear(d * fadeT):diffusealpha(1):sleep(t)
				self:linear(d * fadeT):diffusealpha(0)
				self:queuecommand("Fade")
			end
		} }
	}

	for i=1,3 do a = a[#a] end

	a[#a+1] = Def.Sprite{
		Texture = params.File,
		OnCommand=function(self)

			BGA_G.ObjFuncs(self)

			local frames, p = {}

			for i=1,3 do
				p = p and p:GetParent() or self:GetParent()
				frames[#frames+1] = p
				if i > 1 then BGA_G.ObjFuncs(p) end
			end

			self.Main = frames[3]
			self.SpriteFrame = frames[2]

			self.Main:Center()

			self:SetStates(params)

			self:rotationz( i * cw + 90 )

			if params:IsCmd( "Zoom" ) then
				self:zoom(self:GetZoom() * params.Zoom)
			end

			if params:IsCmd( "Color" ) then
				self:diffuse(params.Color[1])
			end

			if params:IsCmd( "Blend" ) then
				self:blend(params.Blend)
			end

			self:PlayCmds(params)


			local s = i * tweenT
			s = s / ( math.abs(loop[3]) * params.Slices )
			self:sleep( s * self:GetFullDelay(params) )
			self:queuecommand("Repeat")
			
		end,
		FramePerSpriteCommand=function(self)

			self:animate(false)

			if params.Skip then
				local v = i / loop[3]
				v = math.abs(v) + 1
				v = v % ( params.Frames[2] + 2 )
				if v ~= 0 and i ~= loop[2]
				and i ~= 0 then 
					skip_i = skip_i + loop[3]
				else 
					self:visible(false) 
					skip_i = loop[1]
				end
			else
				offset = offset + 1
			end

			local i = skip_i
			local s = self:GetState() + i / loop[3] + offset

			while s > self:GetNumStates() do 
				s = s - self:GetNumStates()
			end

			while s < 1 do 
				s = s + self:GetNumStates()
			end

			self:setstate(s - 1)

		end,
		SpinCommand=function(self)

			local d = self:GetFullDelay(params) * tweenT
			local t = d * ( params.Waves - 1 ) * 1.25
			t = t + d * fadeT * 2

			if params.SprtSpin then
				local p = self.SpriteFrame
				local rot = p:GetRotationZ()
				rot = rot + params.SprtSpin
				p:linear(t):rotationz(rot)
			end

			local p = self.Main
			local rot = p:GetRotationZ()
			p:linear(t):rotationz(rot - 360 * cw)

		end,
		RepeatCommand=function(self)

			if params.Type == "Spiral" then
				self:queuecommand("Spin")
			end

			if params.InitRot then
				local a = params.InitRot
				self:rotationx(a[1]):rotationy(a[2])
				self:rotationz(a[3])
			end

			local dir_x = math.cos(math.rad(i))
			local dir_y = math.sin(math.rad(i)) * cw
			local h = self:GetZoomedHeight()
			local d = self:GetFullDelay(params) * tweenT

			local p = self.SpriteFrame
			p:x( h * 1.5 * dir_x )
			p:y( h * 1.5 * dir_y )

			local t = d * ( params.Waves - 1 ) * 1.25
			self:z(params.Dir[1])
			self:linear(t + d * fadeT * 2):z(params.Dir[2])
			self:queuecommand("Repeat")

		end

	}

end

t = not params.Remove and t

return Def.ActorFrame{ t }