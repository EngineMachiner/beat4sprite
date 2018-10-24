local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("A.lua")..{
		OnCommand=cmd(y,60*ScaleVar)
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(y,-600*ScaleVar;linear,16;y,120*ScaleVar;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On");
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(y,120*ScaleVar;linear,16;y,840*ScaleVar;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On");
	};
}