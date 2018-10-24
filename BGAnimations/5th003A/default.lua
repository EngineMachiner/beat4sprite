local ScaleVar = _screen.h/480

local BG = "../Backgrounds/8 (stretch).png"

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor(BG)..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor(BG)..{
		OnCommand=cmd(Center;x,self:GetX()+self:GetWidth()*ScaleVar;zoom,ScaleVar;zoomx,-1)
	};
	LoadActor(BG)..{
		OnCommand=cmd(Center;x,self:GetX()-self:GetWidth()*ScaleVar;zoom,ScaleVar;zoomx,-1)
	};

	LoadActor("../Backgrounds/Tool.lua", "../Sprites/2 4x4.png", 1/(4*4), ScaleVar, true )..{ 

	OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar )

	},
}