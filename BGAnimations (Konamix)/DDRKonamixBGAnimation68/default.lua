local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd()
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,64*2)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,64*4)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,64*6)
	};
};

return t;