local ScaleVar, file, reverse = ...

local t = Def.ActorFrame{

    LoseFocusCommand=function(self)
      	self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

    Def.Quad{
    	OnCommand=function(self)
    		self:FullScreen()
    	end
    }

}

for k=1,3,2 do
	local num = #t+1
	t[num] = Def.ActorFrame{
		OnCommand=function(self)
			local val = k
			self:zoom(1 + val)
			self:xy( -SCREEN_WIDTH*0.5*val, -SCREEN_HEIGHT*0.5*val )
		end,
	}
	local t_1 = t[num]

	for j=0,7 do
		for i=1,2 do
			t_1[#t_1+1] = Def.Sprite{
				OnCommand=function(self)
					local val = math.sqrt(3)*0.25
					if reverse then 
						t.reverse = - 1
					else
						t.reverse = 1
					end
					self:Center()
					self:Load(file, "stretch")

					local width = self:GetWidth()
					local tex_rect = 0.5*320/width

					self:SetSize(320,320)
					self:customtexturerect(0,0,tex_rect,tex_rect)
					self:SetCustomPosCoords(0,160-67,0,-320*0.5,-320*0.75,-320*0.5,-320*0.75,320*0.5-320*0.25*0.42)
					self:rotationz(45*j)
					self:texcoordvelocity(0,tex_rect*t.reverse)
					if i == 2 then
						self:rotationx(180)
						if j > 0 then
							self:rotationz( self:GetRotationZ() - 90 * j )
						end
					end
					if k == 1 then
						self:addimagecoords(width*(0.6+width/1600),0)
					end
				end
			}
		end
	end
end

	t[#t+1] = LoadActor("1.lua", ScaleVar, file, reverse)..{}

return t