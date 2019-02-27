local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("/BGAnimations/Backgrounds/5th/48 (stretch)")..{
		OnCommand=cmd(Center;zoom,12*ScaleVar;customtexturerect,0,0,12,12)
	};
		LoadActor("../Scripts/InnerEffect", "/BGAnimations/Sprites/5th/spiral.png", 0, ScaleVar, false, true)..{},
}