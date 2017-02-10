local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,3;customtexturerect,0,0,3,3;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075,0;effectclock,'beat')
	};
};

return t;