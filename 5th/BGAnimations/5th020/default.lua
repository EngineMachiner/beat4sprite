local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/49 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/49 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/49 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(diffusealpha,1/(18/4.5))
	};
}