local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,2;texcoordvelocity,0.125,0.125;customtexturerect,0,0,2,2)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,2;texcoordvelocity,0.125,0.125;customtexturerect,0,0,2,2)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;addx,-160;zoom,2;diffusealpha,0.5;texcoordvelocity,0.125,0.125;customtexturerect,0,0,2,2)
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,0;linear,2;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,240;linear,3;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,360;linear,2.5;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,480;linear,3.5;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,160;y,640;linear,2;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,320;y,-160;linear,3;y,640;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,480;y,640;linear,2.5;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,640;y,-160;linear,3.5;y,640;effectclock,'beat';queuecommand,"On")
	};
};

return t;