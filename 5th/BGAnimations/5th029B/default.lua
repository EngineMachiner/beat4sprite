local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/19 (stretch).png")..{
		OnCommand=cmd(Center;zoom,7*ScaleVar;customtexturerect,0,0,7,7)
	},
	LoadActor("../Scripts/ParticlesDown/2","/BGAnimations/Sprites/5th/1.png")..{},
	LoadActor("../Scripts/ParticlesDown/2","/BGAnimations/Sprites/5th/2.png")..{}
}