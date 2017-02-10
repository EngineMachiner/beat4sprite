local t = Def.ActorFrame{
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,160;y,80)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,480;y,80)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,800;y,80)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,160;y,240)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,480;y,240)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,800;y,240)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,160;y,400)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,480;y,400)
	};
	LoadActor("1 TileStill 1x2.png")..{
		OnCommand=cmd(x,800;y,400)
	};
};

return t;