local t = Def.ActorFrame{
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(x,160;y,160)
	};
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(x,480;y,160)
	};
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(x,800;y,160)
	};
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(x,160;y,480)
	};
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(x,480;y,480)
	};
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(x,800;y,480)
	};
};

return t;