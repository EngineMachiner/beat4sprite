local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/3 (stretch).png" )..{},

	LoadActor("../Scripts/InnerEffect", "/BGAnimations/Sprites/5th/Globe 6x1.png", false, true)..{}
	
}