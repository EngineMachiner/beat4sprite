local ScaleVar = _screen.h/480

local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/67 (stretch).png",
	"/BGAnimations/Backgrounds/5th/68 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor( "../Scripts/AnimatedCTR", Backgrounds, 0.5 )..{},
	
	LoadActor("../Scripts/ParticlesLeft","/BGAnimations/Sprites/5th/Globe 6x1.png")..{}

}