local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/27 (stretch).png")..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/27 (stretch).png")..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-ScaleVar)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/27 (stretch).png")..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-ScaleVar)
	};
	LoadActor("../Scripts/ParticlesUp/default.lua","rhombus 5x1.png", 1/5, ScaleVar)..{};
}