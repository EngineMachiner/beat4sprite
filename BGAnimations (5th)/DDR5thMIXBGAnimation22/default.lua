local t = Def.ActorFrame{
	LoadActor("1 TileStill (stretch).png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,320;y,60)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,960;y,60)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,320;y,180)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,960;y,180)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,320;y,300)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,960;y,300)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,320;y,420)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,960;y,420)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,320;y,540)
	};
	LoadActor("2 TileStill 1x2.png")..{
		OnCommand=cmd(x,960;y,540)
	};
};

return t;