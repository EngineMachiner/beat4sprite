local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/58 (stretch).png")..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor("../Backgrounds/58 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()+self:GetWidth()*ScaleVar;zoom,ScaleVar;zoomx,-1)
	};
	LoadActor("../Backgrounds/58 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()-self:GetWidth()*ScaleVar;zoom,ScaleVar;zoomx,-1)
	};
	LoadActor("../ParticleEffects/InnerEffect/Reversed", "/BGAnimations/Sprites/Spheres 4x3.png", 0, ScaleVar, false, true)..{},
}