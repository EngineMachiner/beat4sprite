
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/Tool.lua", "../Sprites/1 2x2.png", 1/(2*2), ScaleVar )..{ 

	OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar )

	},
}