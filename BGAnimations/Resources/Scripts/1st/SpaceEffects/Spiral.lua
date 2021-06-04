local params = ...
local p = params

BGA_G.DefPar( p )

-- Set defaults in case there's no value
p.Slices = p.Slices or 5
p.Dir = p.Dir == "Out" and { -300, 50, 1 } or { 50, -300, -1 }
p.Clockwise = p.Clockwise == nil and -1 or 1

p.Speed = p.Speed or 1
p.HurryTweenBy = p.HurryTweenBy or p.Speed

p.ZSpacing = p.ZSpacing or 1
p.IRot = p.IRot or 0
p.SState = p.SState or 0
p.Remainder = p.Remainder or 1
p.SpinAng = p.SpinAng or 0

params = p

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(170)
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local length = math.abs(p.Dir[1]) + math.abs(p.Dir[2])
local cw, n, d = p.Clockwise, ( p.Slices + 1 ) * 2, p.Remainder
local twnby = p.HurryTweenBy
local total = 360 * 5 - 360 / n - 360 * d / n

local i_rot = p.IRot

local num = 0
local num_s = p.SState - cw

for i = 0, total, 360 * d / n  do
	
	if num < n * 0.5 - 1
	or not p.Skip then
		num = num + 1
		t[#t+1] = Def.ActorFrame{

			OnCommand=function(self)
				self:set_tween_uses_effect_delta(true)
				self:effectclock('beat')
				BGA_G.ScreenPreview(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				self:rotationz( p.SpinAng )
				self:queuecommand("Spin")
			end,

			SpinCommand=function(self)
				self:stoptweening()
				self:linear( 8 * twnby * BGA_G.GetDelay(self)[2] )
				self:rotationz( self:GetRotationZ() + 360 * cw )
				self:queuecommand("Spin")
			end,
				
			Def.ActorFrame{

				OnCommand=function(self)
					self:set_tween_uses_effect_delta(true)
					self:effectclock('beat')
					BGA_G.PlayCmds(self, p)
					self:diffusealpha(0)
					self:z( ( i * 0.2 - length * 0.5 ) * cw  )
					self:queuecommand("InitState")
					self:queuecommand("Repeat")
				end,

				Def.ActorFrame{

					Def.Sprite{
						
						OnCommand=function(self)

							self:set_tween_uses_effect_delta(true)
							self:effectclock('beat')
							self:Load(p.File)
							BGA_G.SetStates(self, p)
							
							self:zoom(1)
							self:rotationz( i_rot )

							if p.Rot then
								self:rotationz( self:GetRotationZ() + 90 - i * cw )
							end
							
						end,

						InitStateCommand=function(self)

							local dir_x = math.cos(math.rad(i))
							local dir_y = math.sin(math.rad(i)) * cw
							local scl = _screen.h / 480

							self:x( self:GetZoomedWidth() * scl * 2 * dir_x )
							self:y( - self:GetZoomedHeight() * scl * 2 * dir_y )
							self:zoom( p.Zoom )
							self:GetParent():GetParent():diffusealpha(1)

							local pa = self:GetParent():GetParent()
							pa:SetUpdateFunction(function()
		
								local e = p.Dir

								if pa:GetZ() < e[2] and e[2] < 0
								or pa:GetZ() > e[2] and e[2] > 0 then
									local d = math.abs( e[1] + e[2] ) * e[3]
									pa:z( pa:GetZ() - d * 1.5 )
								else
									local l = twnby * 0.5 / ( 60 * 8 )
									pa:z( pa:GetZ() + math.abs( e[1] + e[2] ) * e[3] * l )
								end
		
							end)

						end,

						RepeatCommand=function(self)

							if not p.Rot then 
								self:linear( 8 * twnby * BGA_G.GetDelay(self)[2] )
								self:rotationz( self:GetRotationZ() - 360 * cw )
								self:queuecommand("Repeat")
							end
		
						end,

						BlendCommand=function(self)
							self:blend(p.Blend)
						end,

						FramePerSpriteCommand=function(self)

							self:animate(false)

							local s = num_s

							while s > self:GetNumStates() do 
								s = s - self:GetNumStates()
							end

							while s < 1 do 
								s = s + self:GetNumStates()
							end

							self:setstate(s-1)

							num_s = num_s - cw

						end,

						ColorCommand=function(self)
							self:diffuse(p.Color[1])
						end

					}

				}

			}

		}

	else

		local a = cw == - 1 and 0 or 1
		num_s = p.SState - a + 1
		num = 0

	end

end

return Def.ActorFrame{ t }