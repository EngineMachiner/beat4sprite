local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,9;customtexturerect,0,0,9,9;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*4.5,0;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,3;customtexturerect,0,0,3,3;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.5,0;effectclock,'beat')
	};
};

return t;