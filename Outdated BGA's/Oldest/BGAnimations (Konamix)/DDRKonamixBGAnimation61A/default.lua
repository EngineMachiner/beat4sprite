local t = Def.ActorFrame{
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*2,0;effectclock,'beat')
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(rainbow)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,160;rainbow)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,320;rainbow)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;rainbow)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,160;rainbow)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,320;rainbow)
	};
};

return t;