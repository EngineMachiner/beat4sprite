
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/8 (stretch).png")..{},

	LoadActor("../Scripts/ParticlesDown", "/BGAnimations/Sprites/5th/Rhombus 5x1.png")..{}
	
}