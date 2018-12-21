local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A2.lua")..{
		OnCommand=cmd()
	};
	LoadActor("A2.lua")..{
		OnCommand=cmd(addy,120*ScaleVar)
	};
	LoadActor("A2.lua")..{
		OnCommand=cmd(addy,120*2*ScaleVar)
	};
	LoadActor("A2.lua")..{
		OnCommand=cmd(addy,120*3*ScaleVar)
	};

}