local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/63 (stretch).png")..{
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,5,5)
	};
		LoadActor("../Scripts/InnerEffect/Reversed", "/BGAnimations/Sprites/5th/Globe 6x1.png", 1/6, ScaleVar, false, true)..{},
}