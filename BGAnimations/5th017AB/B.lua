local file = "../Sprites/2 1x4.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoom,ScaleVar;y,60*ScaleVar;SetAllStateDelays,1/self:GetNumStates()/2;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoom,ScaleVar;y,180*ScaleVar;SetAllStateDelays,1/self:GetNumStates()/2;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoom,ScaleVar;y,300*ScaleVar;SetAllStateDelays,1/self:GetNumStates()/2;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoom,ScaleVar;y,420*ScaleVar;SetAllStateDelays,1/self:GetNumStates()/2;effectclock,'beat')
	};
}