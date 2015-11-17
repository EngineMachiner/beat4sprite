local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*1.75;effectclock,'beat')
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.25;addy,SCREEN_HEIGHT*0.25;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;effectclock,'music')
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.75;addy,SCREEN_HEIGHT*0.25;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;rotationy,180;effectclock,'music')
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.75;addy,SCREEN_HEIGHT*0.75;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;rotationy,180;rotationx,180;effectclock,'music')
	};
	LoadActor("2 2x2")..{
		OnCommand=cmd(addx,SCREEN_WIDTH*0.25;addy,SCREEN_HEIGHT*0.75;blend,"BlendMode_Add";zoomto,SCREEN_WIDTH*0.5,SCREEN_HEIGHT*0.5;rotationx,180;effectclock,'music')
	};

};

return t;