local tool_sprite = "../Sprites/plates 4x1.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua")..{
		OnCommand=cmd()
	};
	LoadActor("../Backgrounds/Tool.lua", tool_sprite, 1/4, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75;x,self:GetChild("template"):GetWidth()*ScaleVar/2); },
}