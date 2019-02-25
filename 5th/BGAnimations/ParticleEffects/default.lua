local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/1 5x1.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("../Backgrounds/Tool.lua", tool_sprite, 1/5, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75); },
}