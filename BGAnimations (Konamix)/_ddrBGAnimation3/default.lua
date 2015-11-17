local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;pulse;effectmagnitude,1.0625,1,0)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropright,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';diffusealpha,0.5;faderight,0.0625;fadebottom,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropleft,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';diffusealpha,0.5;fadetop,0.0625;fadeleft,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropleft,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;fadeleft,0.0625;fadebottom,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropright,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;faderight,0.0625;fadetop,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropright,0.5;pulse;effectmagnitude,1.0325,1,0;effectclock,'beat';diffusealpha,0.5;faderight,0.0625;fadebottom,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropleft,0.5;pulse;effectmagnitude,1.0625,1,0;effectclock,'beat';diffusealpha,0.5;fadetop,0.0625;fadeleft,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,0.5;cropleft,0.5;pulse;effectmagnitude,1.0625,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.25;fadeleft,0.0625;fadebottom,0.0625)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0.5;cropright,0.5;pulse;effectmagnitude,1.0625,1,0;effectclock,'beat';effectoffset,0.5;diffusealpha,0.25;faderight,0.0625;fadetop,0.0625)
	};
};

return t;