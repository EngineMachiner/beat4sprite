local t = Def.ActorFrame{
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,256)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,512)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,768)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addy,256)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,256;addy,256)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,512;addy,256)
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,768;addy,256)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,256)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,512)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,768)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addy,256)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,256;addy,256)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,512;addy,256)
	};
	LoadActor("2 4x2")..{
		OnCommand=cmd(x,128;y,128;addx,768;addy,256)
	};
};

return t;