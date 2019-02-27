local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/21 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,6;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/20 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,5;diffusealpha,0;sleep,1;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/19 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,4;diffusealpha,0;sleep,2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/18 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,3;diffusealpha,0;sleep,3;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/17 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,2;diffusealpha,0;sleep,4;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/16 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,1;diffusealpha,0;sleep,5;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}