
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/8 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/7 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/6 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/5 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds,0.25)..{}
	
}