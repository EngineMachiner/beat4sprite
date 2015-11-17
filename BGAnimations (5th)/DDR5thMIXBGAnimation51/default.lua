local t = Def.ActorFrame{
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;rotationx,180;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationx,180;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;rotationx,180;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,-1,-1;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationx,180;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,0;linear,0.6;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.5;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,0;linear,0.7;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,0;linear,0.8;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_CENTER_Y;linear,0.9;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_BOTTOM;linear,1;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;linear,1.2;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;linear,1.3;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;linear,1.4;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
};

return t;