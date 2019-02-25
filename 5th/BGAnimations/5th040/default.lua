local ScaleVar = _screen.h/480
local file = "../Sprites/1 1x2.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/Tool.lua", file, 1, ScaleVar, false )..{},
}