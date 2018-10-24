local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("3")..{
		OnCommand=cmd();
	};
	LoadActor("3")..{
		OnCommand=cmd(x,640);
	};
};

return t;