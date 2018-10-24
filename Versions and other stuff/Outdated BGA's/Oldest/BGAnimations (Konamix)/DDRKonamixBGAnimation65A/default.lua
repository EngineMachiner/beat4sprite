local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,7;customtexturerect,0,0,7,7;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0.075*1.75;effectclock,'beat')
	};
};

return t;