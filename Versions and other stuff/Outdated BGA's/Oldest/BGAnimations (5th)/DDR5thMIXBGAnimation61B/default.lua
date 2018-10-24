local t = Def.ActorFrame{
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,64;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,192;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,320;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,448;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,576;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,704;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,832;y,60)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,64;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,192;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,320;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,448;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,576;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,704;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,832;y,180)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,64;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,192;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,320;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,448;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,576;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,704;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,832;y,300)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,64;y,420)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,192;y,420)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,320;y,420)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,448;y,420)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,576;y,420)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,704;y,420)
	};
	LoadActor("1 TileStill 5x4.png")..{
		OnCommand=cmd(x,832;y,420)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;zoomto,1920,120;texcoordvelocity,1,0;customtexturerect,0,0,3,1)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,320;y,120;texcoordvelocity,-1,0;customtexturerect,0,0,3,1)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,160;y,240;texcoordvelocity,1,0;customtexturerect,0,0,3,1)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-320;y,360;texcoordvelocity,-1,0;customtexturerect,0,0,3,1)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-160;y,480;texcoordvelocity,1,0;customtexturerect,0,0,3,1)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,0;y,SCREEN_CENTER_Y;zoomto,160,960;texcoordvelocity,0,1;customtexturerect,0,0,1,2)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,160;zoomto,160,960;addx,320;y,SCREEN_CENTER_Y;texcoordvelocity,0,-1;customtexturerect,0,0,1,2)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,320;zoomto,160,960;addx,160;y,SCREEN_CENTER_Y;texcoordvelocity,0,1;customtexturerect,0,0,1,2)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,480;zoomto,160,960;addx,-320;y,SCREEN_CENTER_Y;texcoordvelocity,0,-1;customtexturerect,0,0,1,2)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,640;zoomto,160,960;addx,-160;y,SCREEN_CENTER_Y;texcoordvelocity,0,1;customtexturerect,0,0,1,2)
	};
};

return t;