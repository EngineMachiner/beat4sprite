local t = Def.ActorFrame{
	LoadActor("1 TileStill.png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,3;y,-480;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,480;linear,3;y,0;queuecommand,"On")
	};
};

return t;