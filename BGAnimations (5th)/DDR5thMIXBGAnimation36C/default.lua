local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,3;texcoordvelocity,-1,0;customtexturerect,0,0,3,3;rainbow)
	};
};

return t;