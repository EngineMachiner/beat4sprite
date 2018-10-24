local t = Def.ActorFrame{
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,320;y,60)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,960;y,60)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,320;y,180)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,960;y,180)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,320;y,300)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,960;y,300)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,320;y,420)
	};
	LoadActor("1 TileStill 1x4.png")..{
		OnCommand=cmd(x,960;y,420)
	};
};

return t;