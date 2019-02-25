local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/30 (stretch).png")..{
		OnCommand=cmd(Center;zoom,7*ScaleVar;customtexturerect,0,0,7,7)
	},
	LoadActor("../ParticleEffects/WallBumpEffect1stCycle/default.lua","/BGAnimations/Sprites/Snake.png", ScaleVar)..{};
}