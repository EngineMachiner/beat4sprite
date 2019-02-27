local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/62 (stretch).png")..{
		OnCommand=cmd(Center;zoom,3*ScaleVar;customtexturerect,0,0,3,3)
	};
	LoadActor("../Scripts/ParticlesRight", "Leave.png")..{},
}