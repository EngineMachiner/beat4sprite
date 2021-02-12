local params = ...
local ScaleVar = _screen.h/480

PSX_BGA_Globals["BGA_NoParams"]( params )

local t = Def.ActorFrame{
	InitCommand=function(self)
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(170)
	end,
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

local cw, n, d = params.Clockwise, params.Slices, params.Remainder
local z_s, spacing = params.Speed, params.ZSpacing
local i_rot, state = params.IRot, params.SState
local num, b = 0, 0
i_rot = cw == 1 and i_rot + 180 or i_rot

--360 * 6 - 360 / n - 360 * d / n, 360 / n
for i = 0, 360 * 6 - 360 / n - 360 * d / n, 360 / n  do

	local c_state
	if params.Pattern and params.Slices then 
		if i * n / 360 >= ( params.Pattern + 1 ) * b then 
			b = b + 1
			c_state = true
		end
	end
	
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			PSX_BGA_Globals["BGA_ToolPreview"](self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			self:rotationz( params.SpinAng )
			self:queuecommand("Spin")
		end,
		SpinCommand=function(self)
			self:linear( 8 * z_s ):rotationz( self:GetRotationZ() - 360 * cw )
			self:queuecommand("Spin")
		end,
			
		Def.ActorFrame{

			OnCommand=function(self)
				self:set_tween_uses_effect_delta(true)
				self:effectclock('beat')
				PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
				self:diffusealpha(0)
				self:z( ( params.InitZ - i * 0.125 ) * spacing )
				self:queuecommand("InitState")
				self:diffusealpha(1)
				self:queuecommand("Repeat")
			end,
			RepeatCommand=function(self)

				local z_lim = params.Dir[2]
				if self:GetZ() >= z_lim and params.Dir[3] > 0
				or self:GetZ() < z_lim and params.Dir[3] < 0 then
					local d = math.abs( params.Dir[1] + z_lim ) * params.Dir[3]
					self:z( self:GetZ() - d * 1.75 )
				else
					local l = z_s * 0.5
					self:linear( l * 3 )
					self:z( self:GetZ() + math.abs( params.Dir[1] + z_lim ) * l * params.Dir[3] * 0.0625 )
					if params.NoRot then
						self:queuecommand("NoRot")
					end
				end
				self:queuecommand("Repeat")

			end,

			Def.Sprite{
				
				OnCommand=function(self)

					self:set_tween_uses_effect_delta(true)
					self:effectclock('beat')
					self:Load(params.File)
					PSX_BGA_Globals["BGA_FrameSelector"](self, params)
					self.Zoom = self:GetZoom()
					self:zoom(1)

					self:rotationz( i_rot )

					if not params.NoRot then
						self:rotationz( self:GetRotationZ() + 90 - i * cw )
					end

				end,
				InitStateCommand=function(self)

					local p = self:GetParent()
					local dir_x = math.cos(math.rad(i))
					local dir_y = math.sin(math.rad(i)) * cw

					self:x( self:GetZoomedWidth() * ScaleVar * 2 * dir_x )
					self:y( - self:GetZoomedHeight() * ScaleVar * 2 * dir_y )
					self:zoom( params.Zoom )

				end,
				BlendCommand=function(self)
					self:blend(params.Blend)
				end,
				NoRotCommand=function(self)
					self:linear( 4 * z_s )
					self:rotationz( self:GetRotationZ() + 180 * cw )
				end,
				FramePerSpriteCommand=function(self)

					self:animate(false)

					if c_state then 
						self:visible(false)
						state = state - 1
					end 

					local s = i * n / 360 + state + 1

					while s > self:GetNumStates() do 
						s = s - self:GetNumStates()
					end

					while s < 1 do 
						s = s + self:GetNumStates()
					end

					self:setstate(s-1)

				end,
				ColorCommand=function(self)
					self:diffuse(params.Color)
				end

			}

		}

	}

end

return Def.ActorFrame{ t }