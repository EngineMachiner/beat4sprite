
local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/Circle.png", 
	"/BGAnimations/Sprites/5th/Circle2.png"

}

return Def.ActorFrame{
	
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 5x4.png", 3, 3, true )..{ 
		OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75)
	},

	LoadActor("../Scripts/Line", sprites)..{}

}