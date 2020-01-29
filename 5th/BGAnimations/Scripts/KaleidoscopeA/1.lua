local ScaleVar, file, reverse, random = ...

local t = Def.ActorFrame{

    LoseFocusCommand=function(self)
      	self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

}

for j=0,7 do
	for i=1,2 do
		t[#t+1] = Def.Sprite{
			OnCommand=function(self)

				if reverse then 
					t.reverse = - 1
				else
					t.reverse = 1
				end

				self:Center()
				self:Load(file, "stretch")
				
				local h = math.sqrt( self:GetWidth() ^ 2 + self:GetHeight() ^ 2 )

				self:SetSize(320,320)
				self:customtexturerect(0,0,h*0.001*0.25,h*0.001*0.25)
				self:SetCustomPosCoords(0,160-67,0,-320*0.5,-320*0.5,-320*0.5,-320*0.5,320*0.5)
				self:rotationz(45*j)
				self:texcoordvelocity(0,h*0.001*0.25*t.reverse)
				self:addimagecoords( 0 , h * random )

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