
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGEffects/3", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{},

	LoadActor("../Scripts/RandomPosSprite", "/BGAnimations/Sprites/5th/2 Scissors 2x1.png", true, true)..{}

}