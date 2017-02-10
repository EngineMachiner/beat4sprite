local t = Def.ActorFrame{
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,60)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,180)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,300)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,420)
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,420)
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,3;y,-480;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,480;linear,3;y,0;queuecommand,"On")
	};
};

return t;