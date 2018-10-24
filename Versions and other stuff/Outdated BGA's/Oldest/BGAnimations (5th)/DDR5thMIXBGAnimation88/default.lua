local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,0;linear,2.5;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,240;linear,3.5;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,360;linear,2;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,480;linear,3;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,160;y,640;linear,2.5;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,320;y,-160;linear,3.5;y,640;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,480;y,640;linear,2;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,640;y,-160;linear,3;y,640;effectclock,'beat';queuecommand,"On")
	};
};

return t;