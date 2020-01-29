
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/37 (stretch).png",
	"/BGAnimations/Backgrounds/5th/16 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/AnimatedCTR", Backgrounds )..{}

}