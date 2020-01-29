
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/1 (stretch).png", false, false, 2)..{},

	LoadActor("../Scripts/ParticlesDown", "/BGAnimations/Sprites/5th/Flower.png")..{}
}