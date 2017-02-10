local t = Def.ActorFrame{
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,60;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,60;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,60;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,60;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,60;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,60;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,220;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,220;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,220;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,220;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,220;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,220;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,380;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,380;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,380;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,380;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,380;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,380;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,80;y,540;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,240;y,540;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,400;y,540;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,560;y,540;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,720;y,540;effectclock,'beat')
	};
	LoadActor("1 TileStill 4x1.png")..{
		OnCommand=cmd(x,880;y,540;effectclock,'beat')
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd()
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd(hibernate,5)
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd(hibernate,10)
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd(hibernate,15)
	};
};

return t;