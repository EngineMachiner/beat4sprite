local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/5 4x1.png", 2*1/(4), ScaleVar, true )..{},
	
	LoadActor("../Scripts/ParticlesUp", "Globe 6x1.png")..{},

}