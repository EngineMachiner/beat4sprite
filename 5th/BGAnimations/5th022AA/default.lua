
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/4 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/3 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/2 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/1 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds,0.25)..{}
	
}