local t = Def.ActorFrame{
	LoadActor("1.png")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_HEIGHT*SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT*SCREEN_HEIGHT;linear,2;y,-SCREEN_HEIGHT*SCREEN_HEIGHT*0.5;queuecommand,"On")
	};
	LoadActor("2.png")..{
		OnCommand=cmd(hibernate,2;x,SCREEN_CENTER_X;y,SCREEN_HEIGHT*SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT*SCREEN_HEIGHT;linear,2;y,-SCREEN_HEIGHT*SCREEN_HEIGHT*0.5;queuecommand,"On")
	};
	LoadActor("1.png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;croptop,0;linear,2;croptop,1;linear,2,croptop,1;queuecommand,"On")
	};
	LoadActor("2.png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;cropbottom,1;linear,2;cropbottom,1;linear,2;cropbottom,0;queuecommand,"On")
	};
};

return t;