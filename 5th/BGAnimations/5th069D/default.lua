
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 5x1.png", 3, 2)..{},

	LoadActor("../Scripts/InnerEffect/CircleOutSpin", "/BGAnimations/Sprites/5th/head.png", true, true )..{}

}