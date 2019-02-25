local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/32 (stretch).png")..{
		OnCommand=cmd(Center;customtexturerect,0,0,8,8;zoom,8*ScaleVar)
	};
	LoadActor("../ParticleEffects/ParticlesLeft", "2 4x1 Letters.png")..{},
}