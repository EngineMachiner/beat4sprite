local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/38 (stretch).png")..{
		OnCommand=cmd(Center;zoom,7*ScaleVar;customtexturerect,0,0,7,7)
	};
		LoadActor("../ParticleEffects/Line/001", "/BGAnimations/Sprites/Jewel.png", "/BGAnimations/Sprites/Ring.png", 0 ,ScaleVar)..{},
}