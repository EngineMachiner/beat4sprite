local t = Def.ActorFrame{
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,80)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,80)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,80)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,80)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,80)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,80)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,240)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,240)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,240)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,240)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,240)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,240)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,400)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,400)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,400)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,400)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,400)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,400)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,560)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,560)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,560)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,560)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,560)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,560)
	};
	LoadActor("2 TileScrollLeft (stretch)")..{
		OnCommand=cmd(Center;zoom,3;texcoordvelocity,0.125,0;customtexturerect,0,0,3,3)
	};
};

return t;