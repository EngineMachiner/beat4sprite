local Color1 = color("0,0,1,1")
local t = Def.ActorFrame{
	LoadActor("1 TileScrollLeft (stretch)")..{
		OnCommand=cmd(Center;zoom,5;texcoordvelocity,0.25,0;customtexturerect,0,0,5,5)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,80;diffuse,Color1)
	};
};

return t;