local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{
		OnCommand=cmd(y,0;linear,(35/3)/(8/6);y,-120*6;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(y,120*6;linear,(35/3)/(8/6);y,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
	LoadActor("../ParticleEffects/ParticlesDownSpin/2", "/BGAnimations/Sprites/SF1.png", "/BGAnimations/Sprites/SF2.png")..{},
}