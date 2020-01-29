
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGEffects/2", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{},
	
	LoadActor("../Scripts/WallBumpEffect", "/BGAnimations/Sprites/5th/2 Sun 2x1.png")..{}

}