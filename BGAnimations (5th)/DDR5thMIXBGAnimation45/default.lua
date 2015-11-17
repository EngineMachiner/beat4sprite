local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,0;rotationz,0;linear,0.6;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,0;rotationz,0;linear,0.7;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,0;rotationz,0;linear,0.8;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_CENTER_Y;rotationz,0;linear,0.9;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_BOTTOM;rotationz,0;linear,1;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;rotationz,0;linear,1.2;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;rotationz,0;linear,1.3;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;rotationz,0;linear,1.4;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;effectclock,'beat';queuecommand,"On");
	};
};

return t;