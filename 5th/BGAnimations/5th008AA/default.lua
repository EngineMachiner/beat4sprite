local ScaleVar = _screen.h/480

local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/14 (stretch).png",
	"/BGAnimations/Backgrounds/5th/15 (stretch).png"

}

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/4 4x1.png", 3, 3, true )..{ 

	OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar 
					x,self:GetChild("template"):GetWidth()/2*ScaleVar ) 

	},

}