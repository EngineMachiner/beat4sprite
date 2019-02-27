local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/58 (stretch).png")..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor("../Backgrounds/5th/58 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()+self:GetWidth()*ScaleVar;zoom,ScaleVar;zoomx,-1)
	};
	LoadActor("../Backgrounds/5th/58 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()-self:GetWidth()*ScaleVar;zoom,ScaleVar;zoomx,-1)
	};
	LoadActor("../Scripts/InnerEffect/Reversed", "/BGAnimations/Sprites/5th/Spheres 4x3.png", 0, ScaleVar, false, true)..{},
}