local ScaleVar, file, reverse = ...

local t = Def.ActorFrame{

    LoseFocusCommand=function(self)
      	self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

}

for j=0,7 do
	for i=1,2 do
		t[#t+1] = Def.Sprite{
			OnCommand=function(self)
				local val = math.sqrt(3)*0.25
				if reverse then 
					t.reverse = - 1
				else
					t.reverse = 1
				end
				self:Center()
				self:Load(file, "stretch")

				local tex_rect = 0.5*320/self:GetWidth()

				self:SetSize(320,320)
				self:customtexturerect(0,0,tex_rect,tex_rect)
				self:SetCustomPosCoords(0,160-67,0,-320*0.5,-320*0.5,-320*0.5,-320*0.5,320*0.5)
				self:rotationz(45*j)
				self:texcoordvelocity(0,tex_rect*t.reverse)
				if i == 2 then
					self:rotationx(180)
					if j > 0 then
						self:rotationz( self:GetRotationZ() - 90 * j )
					end
				end
			end
		}
	end
end

return t