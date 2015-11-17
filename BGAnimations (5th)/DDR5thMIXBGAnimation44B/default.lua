local t = Def.ActorFrame{
	LoadActor("1 TileScrollUp (stretch)")..{
		OnCommand=cmd(Center;zoom,5;texcoordvelocity,0,-0.40;customtexturerect,0,0,5,5)
	};
};

return t;