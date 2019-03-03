
local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/1 2x1.png"

local sprites = {

	"/BGAnimations/Sprites/5th/Leave.png"
	
}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", tool_sprite, 1/2, ScaleVar, false )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/2)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("OneTwoStates")
		end
 	},

	LoadActor("../Scripts/SpiralSprite", sprites, true)..{}

}