local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;bob;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.0625;bob;effectmagnitude,10,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.125;bob;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.1875;bob;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.25;bob;effectmagnitude,40,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.3125;bob;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.375;bob;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.4375;bob;effectmagnitude,10,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.5;bob;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.5625;bob;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.625;bob;effectmagnitude,40,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.6875;bob;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.75;bob;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.8125;bob;effectmagnitude,10,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.875;bob;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;fadeleft,0.125;faderight,0.125;croptop,0.9375;bob;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,64;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,192;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,320;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,448;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,576;pulse;effectmagnitude,1,0,0,0;effectclock,'beat';blend,'BlendMode_Add')
	};
};

return t;