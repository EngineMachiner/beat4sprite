local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*2,0;effectclock,'beat')
	};
};

return t;