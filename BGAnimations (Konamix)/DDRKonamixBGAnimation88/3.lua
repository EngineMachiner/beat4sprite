local t = Def.ActorFrame{
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;addx,160;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;addx,320;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;addx,480;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;addx,640;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;addx,800;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,80;y,80;addx,960;pulse;effectmagnitude,1,0,0;effectclock,'beat';blend,"BlendMode_Add")
	};
};

return t;