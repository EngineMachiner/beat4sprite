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
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(x,160;linear,2.5;x,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(x,0;linear,2.5;x,-160;queuecommand,"On")
	};
};

return t;