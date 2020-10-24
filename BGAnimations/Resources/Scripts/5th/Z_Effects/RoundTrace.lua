local params = ...
local ScaleVar = _screen.h/480

PSX_BGA_Globals["BGA_NoParams"]( params )

local num = -2

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(120)
	end,
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}


local cw

if params.Dir == "Out" then
	params.Dir = { -1000, 0 }
else
	params.Dir = { 0, -1000 }
end

if params.Clockwise then 
	cw = -1
	loop = { 360-45, 0, -45 }
else
	cw = 1
	loop = { 0, 360-45, 45 }
end

for i = loop[1], loop[2], loop[3] do
	num = num + 1
	t[#t+1] = Def.Sprite{
			
		OnCommand=function(self)

			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			self:Load(params.File)
			PSX_BGA_Globals["BGA_FrameSelector"](self, params)

			self:rotationz(i*cw+90)
				:diffusealpha(0)
				:sleep(math.rad(i+45)*0.5)
				:queuecommand("Repeat")
			
		end,
		RepeatCommand=function(self)
			
			if params.Rotation then
				self:rotationz(self:GetRotationZ()+360*2)
			end

			local dir_x = math.cos(math.rad(i))
			local dir_y = math.sin(math.rad(i)) * cw

			self:x( SCREEN_CENTER_X + self:GetZoomedHeight() * ScaleVar * 1.5 * dir_x )
			self:y( SCREEN_CENTER_Y - self:GetZoomedHeight() * ScaleVar * 1.5 * dir_y )
			self:z(params.Dir[1])
			self:diffusealpha(1)
			self:linear(num*0.5):z(params.Dir[2]):linear(0.25*0.5):diffusealpha(0)
			self:queuecommand("Repeat")

		end
	}
end

return Def.ActorFrame{ t }