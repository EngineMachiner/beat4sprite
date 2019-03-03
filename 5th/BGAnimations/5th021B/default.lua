local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/Frog 1x2.png"
local file = "/BGAnimations/Backgrounds/5th/29 (stretch).png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-ScaleVar)
	};
	LoadActor("../Scripts/TileTool", tool_sprite, 1/2, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75); },
}