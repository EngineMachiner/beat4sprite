
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/12 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/11 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/10 (stretch).png",
	"/BGAnimations/Backgrounds/5th/DanceBackgrounds/9 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/AnimatedCTR", Backgrounds, 0.25, false, -0.5 )..{}
	
}