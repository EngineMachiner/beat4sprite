return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{
		OnCommand=cmd(rainbow;diffusealpha,0.5;effectperiod,8;effectclock,'beat')
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(rainbow;diffusealpha,0.5;effectperiod,8;blend,"BlendMode_Add";effectclock,'beat')
	};
};