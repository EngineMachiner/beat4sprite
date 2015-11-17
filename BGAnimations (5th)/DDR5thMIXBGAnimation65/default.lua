local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,160;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,480;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,800;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,160;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,480;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,800;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,160;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,480;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,800;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,160;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,480;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,800;y,420;spin;effectmagnitude,90,0,0)
	};

};

return t;