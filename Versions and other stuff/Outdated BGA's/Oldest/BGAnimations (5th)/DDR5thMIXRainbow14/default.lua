local t = Def.ActorFrame{
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;rotationx,180;effectclock,'beat')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationx,180;effectclock,'beat')
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationy,180;rotationx,180;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;cropbottom,0.5;cropright,0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;customtexturerect,0,0,2,2;rainbow;rotationx,180;blend,"BlendMode_Add";effectclock,'beat';effectoffset,0.5)
	};
};

return t;