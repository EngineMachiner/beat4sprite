
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/36 (stretch).png",
	"/BGAnimations/Backgrounds/5th/35 (stretch).png",
	"/BGAnimations/Backgrounds/5th/34 (stretch).png",
	"/BGAnimations/Backgrounds/5th/33 (stretch).png"

}

local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/AnimatedCTR", Backgrounds, 0.25 )..{},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/plates 4x1.png", 3, 2, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75;x,self:GetChild("template"):GetWidth()*ScaleVar/2); },
}