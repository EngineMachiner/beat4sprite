local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(Center;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(Center;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1")..{
		OnCommand=cmd(Center;addx,640;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(Center;addx,640;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1")..{
		OnCommand=cmd(Center;addx,-640;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(Center;addx,-640;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat';effectoffset,0.5)
	};
};

return t;