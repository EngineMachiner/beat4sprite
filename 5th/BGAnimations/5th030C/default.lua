local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/39 (stretch)")..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/39 (stretch)")..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-ScaleVar)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/39 (stretch)")..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-ScaleVar)
	};
		LoadActor("../Scripts/InnerEffect/Reversed", "/BGAnimations/Sprites/5th/Circle.png", 0, ScaleVar, false, false, true)..{},
}