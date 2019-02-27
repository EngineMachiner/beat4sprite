local tool_sprite = "/BGAnimations/Sprites/5th/cutlery 1x2.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Scripts/TileTool", tool_sprite, 1/2, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.325); },
}