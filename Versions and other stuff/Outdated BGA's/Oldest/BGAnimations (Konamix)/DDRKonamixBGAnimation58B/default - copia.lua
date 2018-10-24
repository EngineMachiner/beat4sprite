local t = Def.ActorFrame{
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addx,320;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addx,640;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addx,960;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addx,320;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addx,640;addy,240;blend,"BlendMode_Add")
	};
	LoadActor("1 2x2")..{
		OnCommand=cmd(x,160;y,120;addx,960;addy,240;blend,"BlendMode_Add")
	};
};

return t;