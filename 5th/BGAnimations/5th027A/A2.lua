local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "../Backgrounds/36 (stretch)", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,4/4;diffusealpha,0;set_tween_uses_effect_delta,true;cropbottom,0.75;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/35 (stretch)", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,3/4;diffusealpha,0;sleep,1/4;set_tween_uses_effect_delta,true;cropbottom,0.75;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/34 (stretch)", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,2/4;diffusealpha,0;sleep,2/4;set_tween_uses_effect_delta,true;cropbottom,0.75;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/33 (stretch)", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,1/4;diffusealpha,0;sleep,3/4;set_tween_uses_effect_delta,true;cropbottom,0.75;effectclock,"beat";queuecommand,"On")
	};
}