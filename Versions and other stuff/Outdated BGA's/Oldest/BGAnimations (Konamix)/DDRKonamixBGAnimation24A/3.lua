local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.875/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.125;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.25;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1.25/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.75;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1.375/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.375;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1.5/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1.625/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.625;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1.75/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.75;set_use_effect_clock_for_texcoords,true;texcoordvelocity,1.875/3,0;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.875;set_use_effect_clock_for_texcoords,true;texcoordvelocity,2/3,0;effectclock,'beat')
	};
};

return t;