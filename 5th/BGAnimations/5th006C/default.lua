local file = "/BGAnimations/Sprites/5th/3 4x1.png"
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,"beat";SetAllStateDelays,1/4;zoom,ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X-self:GetWidth()*ScaleVar;y,SCREEN_CENTER_Y;effectclock,"beat";zoomx,-1;SetAllStateDelays,1/4;zoom,ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X+self:GetWidth()*ScaleVar;y,SCREEN_CENTER_Y;effectclock,"beat";zoomx,-1;SetAllStateDelays,1/4;zoom,ScaleVar)
	};
	LoadActor("../Scripts/Line", "/BGAnimations/Sprites/5th/Star 12x1.png", 1/12, ScaleVar)..{},
}