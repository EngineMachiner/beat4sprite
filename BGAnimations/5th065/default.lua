local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "../Backgrounds/Kaleidoscopes/3 (stretch).png", 
		OnCommand=cmd(Center;zoom,ScaleVar;diffusealpha,1;sleep,2/2*2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/Kaleidoscopes/3 (stretch).png", 
		OnCommand=cmd(Center;zoom,ScaleVar;x,SCREEN_CENTER_X+self:GetWidth();zoomx,-1;diffusealpha,1;sleep,2/2*2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/Kaleidoscopes/3 (stretch).png", 
		OnCommand=cmd(Center;zoom,ScaleVar;x,SCREEN_CENTER_X-self:GetWidth();zoomx,-1;diffusealpha,1;sleep,2/2*2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/Kaleidoscopes/1 (stretch).png", 
		OnCommand=cmd(Center;zoom,ScaleVar;diffusealpha,1;sleep,1/2*2;diffusealpha,0;sleep,1/2*2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/Kaleidoscopes/1 (stretch).png", 
		OnCommand=cmd(Center;zoom,ScaleVar;x,SCREEN_CENTER_X+self:GetWidth();zoomx,-1;diffusealpha,1;sleep,1/2*2;diffusealpha,0;sleep,1/2*2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/Kaleidoscopes/1 (stretch).png", 
		OnCommand=cmd(Center;zoom,ScaleVar;x,SCREEN_CENTER_X-self:GetWidth();zoomx,-1;diffusealpha,1;sleep,1/2*2;diffusealpha,0;sleep,1/2*2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}