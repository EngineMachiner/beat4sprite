local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,16;texcoordvelocity,1,0;customtexturerect,0,0,16,16)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,16;texcoordvelocity,-1,0;customtexturerect,0,0,16,16)
	};
};

return t;