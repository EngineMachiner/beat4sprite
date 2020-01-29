
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/21 (stretch).png",
	"/BGAnimations/Backgrounds/5th/20 (stretch).png",
	"/BGAnimations/Backgrounds/5th/19 (stretch).png",
	"/BGAnimations/Backgrounds/5th/18 (stretch).png",
	"/BGAnimations/Backgrounds/5th/17 (stretch).png",
	"/BGAnimations/Backgrounds/5th/16 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{}

}