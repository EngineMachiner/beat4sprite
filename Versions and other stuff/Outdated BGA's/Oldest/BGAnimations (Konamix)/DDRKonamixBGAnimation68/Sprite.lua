local t = Def.ActorFrame{
	LoadActor("2 5x3")..{
		OnCommand=cmd(x,64;y,64)
	};
	LoadActor("2 5x3")..{
		OnCommand=cmd(x,64*3;y,64)
	};
	LoadActor("2 5x3")..{
		OnCommand=cmd(x,64*5;y,64)
	};
	LoadActor("2 5x3")..{
		OnCommand=cmd(x,64*7;y,64)
	};
	LoadActor("2 5x3")..{
		OnCommand=cmd(x,64*9;y,64)
	};
	LoadActor("2 5x3")..{
		OnCommand=cmd(x,64*11;y,64)
	};
};

return t;