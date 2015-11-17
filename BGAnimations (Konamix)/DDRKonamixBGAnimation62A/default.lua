local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,5;customtexturerect,0,0,5,5;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*1.5;effectclock,'beat')
	};

};

return t;