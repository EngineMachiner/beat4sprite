local params = ...
local ScaleVar = _screen.h/480

BGA_NoParams( params )

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self:zbuffer(true)
   		self:fov(140)
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
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
			
			GainFocusCommand=function(self)

				self:Load(params.File)
				BGA_FrameSelector(self, params)

				if type(params.Commands) == "table" then
			 		for i = 1,#params.Commands do
			 			self:playcommand(params.Commands[i])
			 		end
				elseif type(params.Commands) == "string" then
			 		self:playcommand(params.Commands)
				end

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