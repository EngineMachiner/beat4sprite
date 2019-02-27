local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.ActorFrame{

		Def.Sprite{
		Name="sprt_1",
		Texture = "/BGAnimations/Backgrounds/5th/13 (stretch).png", 
		OnCommand=cmd(Center;zoom,5*ScaleVar;customtexturerect,0,0,5,5;diffusealpha,1;sleep,2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/12 (stretch).png", 
		OnCommand=cmd(Center;zoom,5*ScaleVar;customtexturerect,0,0,5,5;diffusealpha,1;sleep,1;diffusealpha,0;sleep,1;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};

	},
}