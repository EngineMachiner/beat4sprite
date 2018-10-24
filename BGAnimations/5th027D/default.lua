local file = "../Sprites/plates 4x1.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua")..{};
	LoadActor("../ParticleEffects/SpiralSpriteZoomIn", "/BGAnimations/Sprites/plates 4x1.png", 1/4)..{ OnCommand=function(self) 
	self:x(((SCREEN_WIDTH-640)/4)) end },
}