local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "../Backgrounds/21 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,6;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/20 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,5;diffusealpha,0;sleep,1;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/19 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,4;diffusealpha,0;sleep,2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/18 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,3;diffusealpha,0;sleep,3;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/17 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,2;diffusealpha,0;sleep,4;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/16 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,1;diffusealpha,0;sleep,5;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}