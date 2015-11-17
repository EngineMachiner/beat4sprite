local t = Def.ActorFrame{
	LoadActor("2 (stretch).png")..{
		OnCommand=cmd(Center;zoom,15;customtexturerect,0,0,15,15;rainbow;effectclock,'beat')
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,15;customtexturerect,0,0,15,15;rainbow;effectclock,'beat';effectoffset,0.5;blend,"BlendMode_Add")
	};
};

return t;