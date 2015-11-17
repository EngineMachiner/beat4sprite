local t = Def.ActorFrame{
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,7;customtexturerect,0,0,7,7;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*7;effectclock,'beat')
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(diffuse,color("#FF0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,160;diffuse,color("#FF0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,320;diffuse,color("#FF0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;diffuse,color("#FF0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,160;diffuse,color("#FF0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,320;diffuse,color("#FF0000"))
	};
};

return t;