local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua")..{
		OnCommand=cmd(y,0;linear,16;y,-480*ScaleVar;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(y,480*ScaleVar;linear,16;y,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}