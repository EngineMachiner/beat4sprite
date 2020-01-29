local ScaleVar = _screen.h/480

local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/11 (stretch).png",
	"/BGAnimations/Backgrounds/5th/10 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor( "../Scripts/AnimatedCTR", Backgrounds, 0.5 )..{},
	
	LoadActor("../Scripts/WallBumpEffect","/BGAnimations/Sprites/5th/Globe 6x1.png")..{}

}