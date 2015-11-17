local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1;zoom,1;x,SCREEN_RIGHT;y,0;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.1;zoom,1;x,SCREEN_CENTER_X;y,0;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.2;zoom,1;x,SCREEN_LEFT;y,0;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.3;zoom,1;x,SCREEN_LEFT;y,SCREEN_CENTER_Y;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.4;zoom,1;x,SCREEN_LEFT;y,SCREEN_BOTTOM;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.5;zoom,1;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.6;zoom,1;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
	LoadActor("2 6x1")..{
		OnCommand=cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;linear,1.7;zoom,1;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;effectclock,'beat';rotationz,720;queuecommand,"On");
	};
};

return t;