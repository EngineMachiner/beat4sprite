local tool_sprite = "/BGAnimations/Sprites/5th/1 6x1.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Scripts/TileTool", tool_sprite, 2/6, ScaleVar, false )..{},
}