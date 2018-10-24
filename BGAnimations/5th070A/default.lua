local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/63 (stretch).png")..{
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,5,5)
	};
	LoadActor("../ParticleEffects/InnerEffect/CircleOut","/BGAnimations/Sprites/mushroom.png",0)..{},
}