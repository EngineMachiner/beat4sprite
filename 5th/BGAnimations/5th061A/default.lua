local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/58 (stretch).png")..{},

	LoadActor("../Scripts/InnerEffect/Reversed", "/BGAnimations/Sprites/5th/Spheres 4x3.png", false, true)..{}
}