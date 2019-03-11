local file = "/BGAnimations/Sprites/5th/3 4x1.png"
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	Def.Sprite{
	Name="sprt_1",
	Texture=file,
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,"beat";SetAllStateDelays,1/4;zoom,ScaleVar)
	};
	Def.Sprite{
	Texture=file,
		OnCommand=cmd(x,SCREEN_CENTER_X-self:GetWidth()*ScaleVar;y,SCREEN_CENTER_Y;effectclock,"beat";zoomx,-ScaleVar;SetAllStateDelays,1/4;zoom,ScaleVar)
	};
	Def.Sprite{
	Texture=file,
		OnCommand=cmd(x,SCREEN_CENTER_X+self:GetWidth()*ScaleVar;y,SCREEN_CENTER_Y;effectclock,"beat";zoomx,-ScaleVar;SetAllStateDelays,1/4;zoom,ScaleVar)
	};
}