local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "../Backgrounds/5th/24 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,2/4.5;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"music";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/5th/23 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,1/4.5;diffusealpha,0;sleep,1/4.5;set_tween_uses_effect_delta,true;effectclock,"music";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/5th/24 (stretch).png", 
		OnCommand=cmd(Center;y,440*2*ScaleVar;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,2/4.5;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"music";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/5th/23 (stretch).png", 
		OnCommand=cmd(Center;y,440*2*ScaleVar;zoom,4*ScaleVar;customtexturerect,0,0,4,4;diffusealpha,1;sleep,1/4.5;diffusealpha,0;sleep,1/4.5;set_tween_uses_effect_delta,true;effectclock,"music";queuecommand,"On")
	};
}