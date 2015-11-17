local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("2 1x4.png")..{
		OnCommand=cmd(x,320;y,120;zoom,2;effectclock,'music';diffuse,color("#ff2700");blend,"BlendMode_Add")
	};
	LoadActor("3 1x4.png")..{
		OnCommand=cmd(x,320;y,120*3;zoom,2;effectclock,'music';diffuse,color("#ff2700");blend,"BlendMode_Add")
	};
};

return t;