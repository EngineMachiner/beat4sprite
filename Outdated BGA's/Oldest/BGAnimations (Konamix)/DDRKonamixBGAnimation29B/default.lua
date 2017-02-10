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
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationy,180;x,640;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(rotationx,180;x,0;y,480)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(rotationy,-180;rotationx,180;x,640;y,480)
	};
};

return t;