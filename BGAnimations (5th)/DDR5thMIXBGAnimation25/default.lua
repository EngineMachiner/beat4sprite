local t = Def.ActorFrame{
	LoadActor("1 TileStill (stretch).png")..{
		OnCommand=cmd(Center;addx,640;zoomto,SCREEN_WIDHT,SCREEN_HEIGHT)
	};
	LoadActor("1 TileStill (stretch).png")..{
		OnCommand=cmd(Center;addx,-640;zoomto,SCREEN_WIDHT,SCREEN_HEIGHT)
	};
	LoadActor("1 TileStill (stretch).png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDHT,SCREEN_HEIGHT)
	};
	LoadActor("2 TileScrollLeft (stretch)")..{
		OnCommand=cmd(Center;zoom,3;texcoordvelocity,0.125,0;customtexturerect,0,0,3,3)
	};
};

return t;