local t = Def.ActorFrame{
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,160;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,320;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,480;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,640;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,800;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,960;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,1120;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,160;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,320;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,480;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,640;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,800;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,960;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("2 8x2")..{
		OnCommand=cmd(x,80;y,120;addx,1120;addy,240;blend,"BlendMode_Add")
	};
};

return t;