
local ScaleVar = _screen.h/480

local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/21 (stretch).png",
	"/BGAnimations/Backgrounds/5th/20 (stretch).png"

}

return Def.ActorFrame{
	
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{},
	
	LoadActor("../Scripts/WallBumpEffect","/BGAnimations/Sprites/5th/Skulls 2x1.png")..{}

}