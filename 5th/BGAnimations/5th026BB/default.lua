
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/65 (stretch).png",
	"/BGAnimations/Backgrounds/5th/66 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/AnimatedCTR", Backgrounds, 0.5, false, 1 )..{},
	
	LoadActor("../Scripts/WallBumpEffect","/BGAnimations/Sprites/5th/Burn 2x1.png")..{}
	
}