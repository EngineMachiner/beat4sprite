local params = ...

local scl = _screen.h/480

BGA_G.DefPar( params )

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(120)
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local n = 6
local cw = params.Clockwise and -1 or 1
params.Dir = params.Dir == "Out" and { -1000, 1000 } or { 1000, -1000 }

for i=0,360-360/n,360/n do
	for k=0,180,180 do

		t[#t+1] = Def.ActorFrame{

			OnCommand=function(self)

				self:set_tween_uses_effect_delta(true)
				self:effectclock('beat')

				BGA_G.ScreenPreview(self)

				self:diffusealpha(0)
				self:Center()
				self:diffusealpha(1)

				self:queuecommand("Spin")

			end,

			SpinCommand=function(self)
				local d = BGA_G.GetDelay(self)[2] * 4
				self:linear(d)
				self:rotationz( self:GetRotationZ() + 360 )
				self:queuecommand("Spin")
			end,
			
			Def.Sprite{
			
				OnCommand=function(self)

					self:set_tween_uses_effect_delta(true)
					self:effectclock('beat')
					self:Load(params.File)
					BGA_G.SetStates(self, params)
					self:queuecommand("InitState")

				end,
				InitStateCommand=function(self)

					local angle = k + 360 + i
					local dir_x = math.cos(math.rad(angle))
					local dir_y = math.sin(math.rad(angle)) * cw
					local val = params.Dir[1] / math.abs(params.Dir[1])
					local w = self:GetZoomedWidth()
					local h = self:GetZoomedHeight()
					local total = math.abs(params.Dir[1]) + math.abs(params.Dir[2])

					self:x( self:GetZoomedWidth() * scl * dir_x )
					self:y( - self:GetZoomedHeight() * scl * dir_y )
					self:z( ( w * h * 0.05 * 0.1 - i * 5 - k ) * val + total * cw * 0.5 )
					self:rotationz( ( - i + 180 ) * cw )

					self:queuecommand("Repeat")

				end,
				RepeatCommand=function(self)

					self:GetParent():SetUpdateFunction(function()

						local d = self:GetEffectDelta()
						
						if self:GetZ() < params.Dir[2] and params.Dir[2] < 0
						or self:GetZ() > params.Dir[2] and params.Dir[2] > 0 then
							if params.Rotation then 
								self:rotationz( ( - i + 180 ) * cw )
							end
							self:z( self:GetZ() - params.Dir[2] * 8 * 0.05 * 5 )
						else
							self:z( self:GetZ() + params.Dir[2] * 8 * 0.05 * d )
							if params.Rotation then 
								self:rotationz( self:GetRotationZ() + 45 * 0.0625 * cw )
							end
						end

					end)


				end

			}

		}

	end
end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }