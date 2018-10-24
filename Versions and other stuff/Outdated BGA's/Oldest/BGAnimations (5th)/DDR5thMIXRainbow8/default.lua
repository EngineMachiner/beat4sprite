local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,10;customtexturerect,0,0,10,10;rainbow;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,10;customtexturerect,0,0,10,10;rainbow;effectclock,'beat';effectoffset,0.5)
	};
};

return t;