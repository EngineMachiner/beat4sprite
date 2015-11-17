local t = Def.ActorFrame{
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,160;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,320;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,480;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,640;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,800;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,960;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,1120;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,160;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,320;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,480;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,640;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,800;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,960;addy,240;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,80;y,120;addx,1120;addy,240;effectclock,'beat')
	};
};

return t;