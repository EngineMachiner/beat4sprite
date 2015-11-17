local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.25;addy,SCREEN_HEIGHT*0.25;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5)
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.75;addy,SCREEN_HEIGHT*0.25;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;rotationy,180)
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.75;addy,SCREEN_HEIGHT*0.75;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;rotationy,180;rotationx,180)
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.25;addy,SCREEN_HEIGHT*0.75;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;rotationx,180)
	};

};

return t;