local t = Def.ActorFrame{
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,64;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,192;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,320;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,448;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,576;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,704;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,832;y,60)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,64;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,192;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,320;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,448;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,576;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,704;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,832;y,180)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,64;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,192;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,320;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,448;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,576;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,704;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,832;y,300)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,64;y,420)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,192;y,420)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,320;y,420)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,448;y,420)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,576;y,420)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,704;y,420)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,832;y,420)
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,0;rotationz,0;linear,0.125;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;rotationz,0;y,0;linear,0.25;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,0;rotationz,0;linear,0.375;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_CENTER_Y;rotationz,0;linear,0.5;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_BOTTOM;rotationz,0;linear,0.625;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;rotationz,0;linear,0.75;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;rotationz,0;linear,0.875;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
	LoadActor("2")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;rotationz,0;linear,1;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,720;queuecommand,"On");
	};
};

return t;