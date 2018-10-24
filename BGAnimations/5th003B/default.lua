local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Backgrounds/Tool.lua", "../Sprites/1 3x1.png", 1/(3*1), ScaleVar )..{ OnCommand=cmd(x,self:GetChild("template"):GetWidth()/2*ScaleVar) },

	LoadActor("../Backgrounds/Tool.lua", "../Sprites/2 4x4.png", 1/(4*4), ScaleVar, true )..{ 

	OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar ) 

	},

}