local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/1 5x1.png", 1/5, ScaleVar )..{},
	LoadActor("../ParticleEffects/InnerEffect/CircleOutSpin", "/BGAnimations/Sprites/head.png", true )..{},

}