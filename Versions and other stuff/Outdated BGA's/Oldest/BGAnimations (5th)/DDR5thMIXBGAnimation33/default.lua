local t = Def.ActorFrame{
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,80;y,60)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,240;y,60)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,400;y,60)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,560;y,60)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,720;y,60)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,880;y,60)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,80;y,220)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,240;y,220)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,400;y,220)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,560;y,220)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,720;y,220)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,880;y,220)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,80;y,380)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,240;y,380)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,400;y,380)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,560;y,380)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,720;y,380)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,880;y,380)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,80;y,540)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,240;y,540)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,400;y,540)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,560;y,540)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,720;y,540)
	};
	LoadActor("1 TileStill 2x1.png")..{
		OnCommand=cmd(x,880;y,540)
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,4;y,-480;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,480;linear,4;y,0;queuecommand,"On")
	};
};

return t;