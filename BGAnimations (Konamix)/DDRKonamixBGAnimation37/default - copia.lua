local t = Def.ActorFrame{
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addx,240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addx,480;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addx,720;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addx,-240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addx,-480;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addx,-720;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;addx,240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;addx,480;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;addx,720;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;addx,-240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;addx,-480;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,240;addx,-720;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;addx,240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;addx,480;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;addx,720;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;addx,-240;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;addx,-480;effectclock,'beat')
	};
	LoadActor("1 3x2")..{
		OnCommand=cmd(Center;addy,-240;addx,-720;effectclock,'beat')
	};
};

return t;