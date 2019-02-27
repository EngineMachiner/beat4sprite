local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/27 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/27 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/27 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("../Scripts/WallBumpEffect1stCycle/default.lua","/BGAnimations/Sprites/5th/rhombus 5x1.png", ScaleVar)..{};
}