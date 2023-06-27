
local parameters = ...		local p = parameters

local numberOf = { x = SCREEN_WIDTH * 0.0078 * 0.5 + 1, y = 6 } 

local t = beat4sprite.ActorFrame()

-- Upper and middle comb.
for k = 1, 2 do

	-- Rows and columns
	for j = 1, numberOf.y do		for i = 1, numberOf.x do

		if i == 1 and j == 1 then

			t[#t+1] = loadfile( beat4sprite.Paths.Templates .. "Kaleidoscopes/Single.lua" )(p) .. {
				OnCommand=function(self)
					self:zoom(0.25) 		p.Target2 = self
					self:GetParent():queuecommand("Target")
				end
			}

		else
		
			t[#t+1] = Def.ActorProxy {

				OnCommand=function(self)

					self:xy( 310 * ( i - 1 ), 178 * ( j - 1 ) )

					if k == 2 then
						self:xy( self:GetX() + 155, self:GetY() - 89 ) 
					end

				end,

				TargetCommand=function(self) self:SetTarget( p.Target2 ) end

			}
		
		end

	end		end

end

return t
