local t = Def.ActorFrame{
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,77;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,236;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,393.5;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,553;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,711;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,870.5;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,77;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,236;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,393.5;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,553;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,711;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,870.5;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,77;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,236;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,393.5;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,553;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,711;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,870.5;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,77;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,236;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,393.5;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,553;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,711;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,870.5;y,420)
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,0;linear,3.5;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,240;linear,2.5;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,360;linear,3;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,480;linear,2;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,160;y,640;linear,3.5;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,320;y,-160;linear,2.5;y,640;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,480;y,640;linear,3;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,640;y,-160;linear,2;y,640;effectclock,'beat';queuecommand,"On")
	};
};

return t;