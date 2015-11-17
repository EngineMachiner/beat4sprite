local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("2 TileScrollLeft (stretch)")..{
		OnCommand=cmd(Center;zoom,3;texcoordvelocity,0.125,0;customtexturerect,0,0,3,3)
	};
};

return t;