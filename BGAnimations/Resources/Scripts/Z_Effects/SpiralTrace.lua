local params = ...
local ScaleVar = _screen.h/480

	BGA_NoParams( params )

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(120)
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

if params.Dir == "Out" then
	params.Dir = { -1000, 1250 }
else
	params.Dir = { 1000, -1250 }
end

for i=0,360*2-360/6,360/6 do -- 2 laps divided in 6 angles each one
	for k=0,180,180 do
		local angle = k + 360 - i / 6
		
		t[#t+1] = Def.ActorFrame{

			GainFocusCommand=function(self)

				self:set_tween_uses_effect_delta(false)
				self:effectclock('beat')
				self:z(params.Dir[1])
				self:diffusealpha(0)
					:sleep(math.rad(i)*0.25*0.5)
					:diffusealpha(1)
					:queuecommand("Repeat")
					
			end,

			RepeatCommand=function(self)

				if math.abs(self:GetZ()) > 1000 then 
					self:z(params.Dir[1])
				end

				self:linear(1):z( self:GetZ() + params.Dir[2] )
				self:queuecommand("Repeat")

			end,

			Def.Sprite{
			
				GainFocusCommand=function(self)

					self:set_tween_uses_effect_delta(true)
					self:effectclock('beat')
					self:Load(params.File)
					BGA_FrameSelector(self, params)

					if i > 360 - 360 / 6 then 
						angle = angle - 180
					end

					self:rotationz(i)

				end,

				RepeatCommand=function(self)

					if params.Rotation then
						self:rotationz(self:GetRotationZ()+360*2)
					end

					if angle >= 360 then 
						angle = angle - 360
					elseif angle < 0 then
						angle = angle + 360
					end

					local dir_x = math.cos(math.rad(angle))
					local dir_y = math.sin(math.rad(angle))

					angle = angle + 2.5 * 6

					self:linear(0.4)
					self:x( SCREEN_CENTER_X + self:GetZoomedWidth()*ScaleVar * 1.5 * dir_x )
					self:y( SCREEN_CENTER_Y - self:GetZoomedHeight()*ScaleVar * 1.5 * dir_y )
					self:queuecommand("Repeat")

				end

			}
		}
	end
end

return Def.ActorFrame{ t }