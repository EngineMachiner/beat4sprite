local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("3")..{
		OnCommand=cmd();
	};
	LoadActor("3")..{
		OnCommand=cmd(hibernate,4.6);
	};
	LoadActor("3")..{
		OnCommand=cmd(hibernate,9.2);
	};
	LoadActor("3")..{
		OnCommand=cmd(hibernate,13.8);
	};
	LoadActor("3")..{
		OnCommand=cmd(hibernate,18,4);
	};
};

return t;