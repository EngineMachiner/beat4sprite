local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,2;texcoordvelocity,0,-0.75;customtexturerect,0,0,2,2)
	};
};

return t;