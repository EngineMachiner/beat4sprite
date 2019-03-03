local file = "/BGAnimations/Sprites/5th/plates 4x1.png"
local ScaleVar = _screen.h/480

local sprites = {
	
	"/BGAnimations/Sprites/5th/plates 4x1.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("B.lua")..{},

	LoadActor("../Scripts/SpiralSprite", sprites)..{}

}