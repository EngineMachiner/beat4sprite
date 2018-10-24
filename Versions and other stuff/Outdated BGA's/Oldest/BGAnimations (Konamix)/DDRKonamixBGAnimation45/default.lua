local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;pulse;effectmagnitude,1.0625,1,0)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropright,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';diffusealpha,0.5;faderight,0.0625;fadebottom,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropleft,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';diffusealpha,0.5;fadetop,0.0625;fadeleft,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropleft,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;fadeleft,0.0625;fadebottom,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropright,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;faderight,0.0625;fadetop,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropright,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';diffusealpha,0.5;faderight,0.0625;fadebottom,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropleft,0.5;pulse;effectmagnitude,1.0625,1,0;effectclock,'beat';diffusealpha,0.5;fadetop,0.0625;fadeleft,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropleft,0.5;pulse;effectmagnitude,1.0625,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.25;fadeleft,0.0625;fadebottom,0.0625)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropright,0.5;pulse;effectmagnitude,1.0625,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.25;faderight,0.0625;fadetop,0.0625)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;zoomto,1920,120;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,320;y,120;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,160;y,240;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-320;y,360;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-160;y,480;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,320;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,160;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,-320;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,-160;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2)
	};
};

return t;