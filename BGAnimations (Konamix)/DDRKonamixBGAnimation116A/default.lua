local t = Def.ActorFrame{
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,60;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,60;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,60;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,60;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,60;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,220;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,220;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,220;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,220;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,220;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,380;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,380;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,380;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,380;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,380;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,540;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,540;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,540;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,540;effectclock,'beat')
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,540;effectclock,'beat')
	};
};

return t;