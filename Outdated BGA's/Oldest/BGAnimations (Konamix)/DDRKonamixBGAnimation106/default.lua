local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,11;customtexturerect,0,0,11,11;addx,50)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,320)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,640)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addy,120)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,320;addy,120)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,640;addy,120)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addy,240)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,320;addy,240)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,640;addy,240)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addy,360)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,320;addy,360)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,640;addy,360)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addy,480)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,320;addy,480)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(x,160;y,60;addx,640;addy,480)
	};
};

return t;