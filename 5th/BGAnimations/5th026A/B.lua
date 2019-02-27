local tool_sprite = "/BGAnimations/Sprites/5th/face 1x2.png"
local ScaleVar = ...
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Scripts/TileTool", tool_sprite, 1/2, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75); },
}