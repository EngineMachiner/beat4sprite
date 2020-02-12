
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGExtender", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{},

	LoadActor( "../Scripts/TileTool", "/BGAnimations/5thBG007A/1 2x1.png", 1, 0, false, 1 )..{}

}