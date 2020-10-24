local params = ...
local ScaleVar = _screen.h/480

PSX_BGA_Globals["BGA_NoParams"]( params )

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:zbuffer(true)
   		self:fov(140)
	end,
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

local num = -2
local cw, rad1, rad2, rad3
local val1, val2, val3

if params.Clockwise then 
	cw = -1
	val1, val2, val3 = 1, 0, -1
else
	cw = 1
	val1, val2, val3 = 0, 1, 1
end

for i=360-15, 0, -15 do
	num = num + 1
	for k=val1, val2, val3 do

		local rot = 0
		t[#t+1] = Def.Sprite{
			
			OnCommand=function(self)

				self:Load(params.File)
				PSX_BGA_Globals["BGA_FrameSelector"](self, params)
				PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)

				self:rotationz(i)
				self:diffusealpha(0)
					:sleep( ( math.rad(i) + math.rad(360-15) * k ) * 0.5 )
					:queuecommand("Repeat")
					:set_tween_uses_effect_delta(true):effectclock('beat')
			
			end,
			TwoSpritesCommand=function(self)
				self:animate(false)
				self:setstate(i % self:GetNumStates())
			end,
			RepeatCommand=function(self)

				if params.Rotation then
					rot = rot + ( 180 ) * cw
				end

				local dir_x = math.cos(math.rad(i))
				local dir_y = math.sin(math.rad(i)) * cw

				self:x( SCREEN_CENTER_X + self:GetZoomedWidth()*ScaleVar * 1.5 * 2 * dir_x )
				self:y( SCREEN_CENTER_Y - self:GetZoomedHeight()*ScaleVar * 1.5 * 2 * dir_y )
				self:z(0)
				self:diffusealpha(1)
				self:linear(num*0.25):z(-1200):rotationz(self:GetRotationZ()+rot)
					:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
					:linear(0.25*0.5):diffusealpha(0)
					:sleep( math.rad(360-15) * 0.1 )
					:queuecommand("Repeat")

				while rot >= 360 do
					rot = rot - 360
				end

				while rot < - 360 do
					rot = rot + 360
				end

			end
		}
	end

end

return Def.ActorFrame{ t }