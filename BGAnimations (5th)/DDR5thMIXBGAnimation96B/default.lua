local t = Def.ActorFrame{
	LoadActor("1 2x1")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
};

return t;