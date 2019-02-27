return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "../Backgrounds/5th/14 (stretch).png", 
		OnCommand=cmd(Center;zoom,4;customtexturerect,0,0,4,4;diffusealpha,1;sleep,2/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/5th/15 (stretch).png", 
		OnCommand=cmd(Center;zoom,4;customtexturerect,0,0,4,4;diffusealpha,1;sleep,1/2;diffusealpha,0;sleep,1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}