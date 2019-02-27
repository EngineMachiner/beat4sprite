local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/50 (stretch).png")..{
		OnCommand=cmd(Center;customtexturerect,0,0,4,4;zoom,4*ScaleVar)
	};
	LoadActor("../Scripts/SpiralSpriteZoomIn", "/BGAnimations/Sprites/5th/2 Sun 2x1.png", 1/2)..{},
}