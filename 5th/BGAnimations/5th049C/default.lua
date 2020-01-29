
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 5x4.png", 3, 3, true )..{ 
		OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75)
	},

	LoadActor("../Scripts/ParticlesDown", "/BGAnimations/Sprites/5th/Circle2.png")..{}
	
}