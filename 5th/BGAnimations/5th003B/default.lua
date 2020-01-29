local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 3x1.png", 3, 2 )..{ OnCommand=cmd(x,self:GetChild("template"):GetWidth()/2*ScaleVar) },

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/2 4x4.png", 3, 2, true )..{ 

	OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar ) 

	},

}