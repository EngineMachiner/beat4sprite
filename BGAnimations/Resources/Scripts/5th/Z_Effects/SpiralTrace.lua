local params = ...
local ScaleVar = _screen.h/480

	PSX_BGA_Globals["BGA_NoParams"]( params )

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

if params.Dir == "Out" then
	params.Dir = { -1000, 1000 }
else
	params.Dir = { 1000, -1000 }
end

local n = 6

if params.Clockwise then 
	cw = -1
else
	cw = 1
end

for i=0,360-360/n,360/n do
	for k=0,180,180 do

		t[#t+1] = Def.ActorFrame{

			OnCommand=function(self)
				self:diffusealpha(0)
				self:set_tween_uses_effect_delta(true)
				self:effectclock('beat')
				PSX_BGA_Globals["BGA_ToolPreview"](self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				self:queuecommand("Spin"):diffusealpha(1)
			end,

			SpinCommand=function(self)
				self:linear(4):rotationz( self:GetRotationZ() + 360 )
				self:queuecommand("Spin")
			end,
			
			Def.Sprite{
			
				OnCommand=function(self)

					self:set_tween_uses_effect_delta(true)
					self:effectclock('beat')
					self:Load(params.File)
					PSX_BGA_Globals["BGA_FrameSelector"](self, params)
					self:queuecommand("InitState")

				end,
				InitStateCommand=function(self)

					local angle = k + 360 + i
					local dir_x = math.cos(math.rad(angle))
					local dir_y = math.sin(math.rad(angle)) * cw
					local val = params.Dir[1] / math.abs(params.Dir[1])

					self:x( self:GetZoomedWidth() * ScaleVar * dir_x )
					self:y( - self:GetZoomedHeight() * ScaleVar * dir_y )
					self:z( ( self:GetWidth() * self:GetHeight() * 0.05 * 0.1 - i * 5 - k ) * val + params.Dir[1] * 4 )
					self:rotationz( ( - i + 180 ) * cw )

					self:queuecommand("Repeat")

				end,
				RepeatCommand=function(self)

					if self:GetZ() < params.Dir[2] and params.Dir[2] < 0
					or self:GetZ() > params.Dir[2] and params.Dir[2] > 0 then
						if params.Rotation then 
							self:rotationz( ( - i + 180 ) * cw )
						end
						self:z( self:GetZ() - params.Dir[2] * 8 * 0.05 * 5 )
						self:queuecommand("Repeat")
					else
						self:linear( 4 * 0.05 * 4 )
						self:z( self:GetZ() + params.Dir[2] * 8 * 0.05 )
						if params.Rotation then 
							self:rotationz( self:GetRotationZ() + 45 * 0.25 * cw )
						end
						self:queuecommand("Repeat")
					end

				end

			}

		}

	end
end

return Def.ActorFrame{ t }