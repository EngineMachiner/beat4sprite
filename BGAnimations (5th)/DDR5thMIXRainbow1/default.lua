local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,15;customtexturerect,0,0,15,15;texcoordvelocity,1,0;rainbow;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,15;customtexturerect,0,0,15,15;texcoordvelocity,1,0;rainbow;effectclock,'beat')
	};
};

return t;