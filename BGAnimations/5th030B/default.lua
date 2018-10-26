local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/39 (stretch)")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor("../Backgrounds/39 (stretch)")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("../Backgrounds/39 (stretch)")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-1)
	};
		LoadActor("../ParticleEffects/InnerEffect/Reversed", "/BGAnimations/Sprites/Circle2.png", 0, ScaleVar, false, false, true)..{},
}