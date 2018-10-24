local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("1.lua")..{
		OnCommand=cmd(y,0;linear,16;set_tween_uses_effect_delta,true;effectclock,"beat";y,-480*ScaleVar;queuecommand,"On")
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(y,480*ScaleVar;linear,16;set_tween_uses_effect_delta,true;effectclock,"beat";y,0;queuecommand,"On")
	};
}