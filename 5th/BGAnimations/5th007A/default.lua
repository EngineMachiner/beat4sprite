
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/13 (stretch).png",
	"/BGAnimations/Backgrounds/5th/12 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{}

}