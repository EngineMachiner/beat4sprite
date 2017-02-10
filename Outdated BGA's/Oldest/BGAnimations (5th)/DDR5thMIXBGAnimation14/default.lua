local t = Def.ActorFrame{
	LoadActor("1 TileStill 2x1")..{
		OnCommand=cmd(Center)
	};
	LoadActor("1 TileStill 2x1")..{
		OnCommand=cmd(Center;addx,640)
	};
	LoadActor("1 TileStill 2x1")..{
		OnCommand=cmd(Center;addx,-640)
	};
};

return t;