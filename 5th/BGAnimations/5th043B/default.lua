
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end
	
}

for a=0,1 do
	for k=-1,2 do
		for i=1,4 do
			t[#t+1] = LoadActor("../Scripts/StaticSprite","/BGAnimations/Sprites/5th/clothes 5x4.png", 1+2*(i-1), 5*(i-1), i%2, 0.25 )..{
				OnCommand=function(self)
					self:xy((640-127)*ScaleVar*k,480*ScaleVar*a)
					self:playcommand("Rainbow")
					self:playcommand("Clothes")
					BGA_TCV_OrL(self, -4, -4, true)
					self:hurrytweening(2)
				end
			}
		end
	end
end

return Def.ActorFrame{ t }