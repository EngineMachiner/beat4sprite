local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

		Def.Sprite{
		Texture = "../Backgrounds/21 (stretch).png", 
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,2*1/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/20 (stretch).png", 
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,1*1/2;diffusealpha,0;sleep,1*1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
	
	LoadActor("../ParticleEffects/WallBumpEffect1stCycle/default.lua","/BGAnimations/Sprites/Skulls2 4x1.png",ScaleVar)..{},		

}