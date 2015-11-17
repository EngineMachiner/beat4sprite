local t = Def.ActorFrame{
	LoadActor("1 TileScrollUp 4x1.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 TileScrollUp 4x1.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-640;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 TileScrollUp 4x1.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+640;y,SCREEN_CENTER_Y)
	};
};

return t;