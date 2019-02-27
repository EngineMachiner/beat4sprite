local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/26 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,2/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/25 (stretch).png", 
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,1/2;diffusealpha,0;sleep,1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}