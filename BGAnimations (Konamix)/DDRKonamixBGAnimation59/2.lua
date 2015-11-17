local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(Center;zoom,9;customtexturerect,0,0,9,9;addx,64;diffuse,color("#FF0000"))
	};
};

return t;