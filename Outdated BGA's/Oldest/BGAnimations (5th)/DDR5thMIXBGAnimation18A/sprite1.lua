local t = Def.ActorFrame{
	LoadActor("2 TileScrollDown 1x4.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,60;effectclock,'beat')
	};
	LoadActor("2 TileScrollDown 1x4.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,180;effectclock,'beat')
	};
	LoadActor("2 TileScrollDown 1x4.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,300;effectclock,'beat')
	};
	LoadActor("2 TileScrollDown 1x4.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,420;effectclock,'beat')
	};
};

return t;