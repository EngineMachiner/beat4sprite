local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		LoadActor("A.lua")..{
		OnCommand=cmd(addy,80*ScaleVar)
	};
		LoadActor("A.lua")..{
		OnCommand=cmd(addy,(80+160)*ScaleVar;addx,160*ScaleVar)
	};
		LoadActor("A.lua")..{
		OnCommand=cmd(addy,(80+160*2)*ScaleVar)
	};
		LoadActor("A.lua")..{
		OnCommand=cmd(addy,(80+160*3)*ScaleVar;addx,160*ScaleVar)
	};

}