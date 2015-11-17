local t = Def.ActorFrame{
	LoadActor("2.png")..{
		OnCommand=cmd(x,100;y,SCREEN_BOTTOM;zoom,0;bounce;effectmagnitude,0,-240,0;linear,1;zoom,1;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2.png")..{
		OnCommand=cmd(hibernate,0.2;x,200;y,SCREEN_BOTTOM;zoom,0;bounce;effectmagnitude,0,-200,0;linear,0.5;zoom,1;;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2.png")..{
		OnCommand=cmd(hibernate,0.4;x,300;y,SCREEN_BOTTOM;zoom,0;bounce;effectmagnitude,0,-180,0;linear,0.8;zoom,1;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2.png")..{
		OnCommand=cmd(hibernate,0.6;x,400;y,SCREEN_BOTTOM;zoom,0;bounce;effectmagnitude,0,-200,0;linear,1.2;zoom,1.5;;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2.png")..{
		OnCommand=cmd(hibernate,0.8;x,500;y,SCREEN_BOTTOM;zoom,0;bounce;effectmagnitude,0,-240,0;linear,0.3;zoom,1;effectclock,'beat';queuecommand,"On");
	};
	LoadActor("2.png")..{
		OnCommand=cmd(hibernate,1;x,600;y,SCREEN_BOTTOM;zoom,0;bounce;effectmagnitude,0,-120,0;linear,1.4;zoom,1;effectclock,'beat';queuecommand,"On");
	};
};

return t;