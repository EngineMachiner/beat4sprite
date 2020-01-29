
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 2x2.png", 4, 2 )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()/2*ScaleVar)
			self:x(-self:GetChild("template"):GetWidth()*ScaleVar)
			BGA_TCV_OrL(self, 1, 0, true)
			self:hurrytweening(2)
		end
	}
}