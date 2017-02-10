local t = Def.ActorFrame{
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,60;y,60;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,220;y,60;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,380;y,60;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,540;y,60;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,700;y,60;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,60;y,180;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,220;y,180;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,380;y,180;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,540;y,180;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,700;y,180;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,60;y,300;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,220;y,300;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,380;y,300;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,540;y,300;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,700;y,300;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,60;y,420;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,220;y,420;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,380;y,420;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,540;y,420;effectclock,'beat')
	};
	LoadActor("1 4x4")..{
		OnCommand=cmd(x,700;y,420;effectclock,'beat')
	};
};

return t;