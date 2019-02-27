local file = "/BGAnimations/Sprites/5th/plates 4x1.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua")..{};
	LoadActor("../Scripts/SpiralSpriteZoomIn", "/BGAnimations/Sprites/5th/plates 4x1.png", 1/4)..{ OnCommand=function(self) 
	self:x(100*ScaleVar) end },
}