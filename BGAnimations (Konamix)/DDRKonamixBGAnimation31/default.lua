local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,5;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075,0;effectclock,'beat';customtexturerect,0,0,5,5)
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(Center)
	};
};

return t;