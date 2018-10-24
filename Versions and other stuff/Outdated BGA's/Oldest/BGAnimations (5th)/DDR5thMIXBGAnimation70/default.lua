local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,3;texcoordvelocity,2,0;customtexturerect,0,0,3,3;rainbow)
	};
	LoadActor("1 5x1.png")..{
		OnCommand=cmd(x,58;y,58;rainbow;effectclock,'beat';effectoffset,3,3)
	};
	LoadActor("1 5x1.png")..{
		OnCommand=cmd(x,58;y,SCREEN_CENTER_Y;rainbow;effectclock,'beat';effectoffset,6,6)
	};
	LoadActor("1 5x1.png")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_BOTTOM;addx,58;addy,-58;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("2 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0;addx,-58;addy,58;rainbow;effectclock,'beat';effectoffset,3,3)
	};
	LoadActor("2 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;addx,-58;rainbow;effectclock,'beat';effectoffset,6,6)
	};
	LoadActor("2 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_BOTTOM;addx,-58;addy,-58;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("2 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT/2;y,SCREEN_BOTTOM;addx,-116;addy,-58;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("1 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT/2;y,SCREEN_BOTTOM;addx,116;addy,-58;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("2 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT/2;y,SCREEN_TOP;addx,-116;addy,58;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("1 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT/2;y,SCREEN_TOP;addx,116;addy,58;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("2 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT/2;y,SCREEN_CENTER_Y;addx,-116;rainbow;effectclock,'beat';effectoffset,9,9)
	};
	LoadActor("1 5x1.png")..{
		OnCommand=cmd(x,SCREEN_RIGHT/2;y,SCREEN_CENTER_Y;addx,116;rainbow;effectclock,'beat';effectoffset,9,9)
	};
};

return t;