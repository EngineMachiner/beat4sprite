local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/1 5x1.png"

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", tool_sprite, 1/5, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75); },

	LoadActor("../Scripts/InnerEffect/Reversed", "/BGAnimations/Sprites/5th/head.png", 0, ScaleVar, false, true)..{};

};

return t