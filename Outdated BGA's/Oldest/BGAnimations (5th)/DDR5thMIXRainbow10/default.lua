local Color1 = color("0,0,1,1");
local t = Def.ActorFrame{
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,5;customtexturerect,0,0,5,5;texcoordvelocity,0,-1;rainbow;effectclock,'beat';diffuse,Color1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,5;customtexturerect,0,0,5,5;texcoordvelocity,0,-1;rainbow;effectclock,'beat';effectoffset,0.5;blend,"BlendMode_Add";diffuse,Color1)
	};
};

return t;