local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua")..{
		OnCommand=cmd(x,640*2;linear,self:GetChild(""):GetChild("sprt_1"):GetWidth()/(260/(9*2));x,320;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(x,320;linear,self:GetChild(""):GetChild("sprt_1"):GetWidth()/(260/(9*2));x,320*-2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		LoadActor("../ParticleEffects/Line", "/BGAnimations/Sprites/2 Scissors 2x1.png", 1/2, ScaleVar)..{},
}