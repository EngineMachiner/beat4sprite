local t = Def.ActorFrame{
	LoadActor("Sprite")..{
		OnCommand=cmd()
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,80*2)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,80*4)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,80*6)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
};

return t;