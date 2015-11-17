local t = Def.ActorFrame{
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,80;y,80;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,240;y,80;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,400;y,80;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,560;y,80;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,720;y,80;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,880;y,80;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,80;y,240;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,240;y,240;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,400;y,240;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,560;y,240;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,720;y,240;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,880;y,240;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,80;y,400;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,240;y,400;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,400;y,400;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,560;y,400;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,720;y,400;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,880;y,400;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,80;y,560;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,240;y,560;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,400;y,560;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,560;y,560;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,720;y,560;texcoordvelocity,0,0.5)
	};
	LoadActor("1 TileScrollDown (stretch).png")..{
		OnCommand=cmd(x,880;y,560;texcoordvelocity,0,0.5)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,0;linear,0.6;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.5;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,0;linear,0.7;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,0;linear,0.8;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_CENTER_Y;linear,0.9;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_LEFT;y,SCREEN_BOTTOM;linear,1;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;linear,1.2;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;linear,1.3;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(zoom,1;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;linear,1.4;zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;effectclock,'beat';queuecommand,"On");
	};
};

return t;