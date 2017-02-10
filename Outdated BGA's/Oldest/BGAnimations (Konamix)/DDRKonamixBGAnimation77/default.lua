local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,13;customtexturerect,0,0,13,13;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*6.5;effectclock,'beat')
	};
};

return t;