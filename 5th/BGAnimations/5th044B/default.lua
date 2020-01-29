
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/27 (stretch).png")..{},

	LoadActor("../Scripts/ParticlesUp","/BGAnimations/Sprites/5th/rhombus 5x1.png")..{}
}