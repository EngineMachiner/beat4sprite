local tool_sprite = "../Sprites/plates 4x1.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua")..{};
	LoadActor("../Backgrounds/Tool.lua", tool_sprite, 1/4, ScaleVar, false )..{
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/1.75)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:RunCommandsOnChildren( function(frame) self:queuecommand("SpinY") end ) 
		end
	},
}