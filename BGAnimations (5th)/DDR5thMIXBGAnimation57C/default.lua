local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,80;y,60;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,240;y,60;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,400;y,60;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,560;y,60;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,720;y,60;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,880;y,60;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,80;y,180;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,240;y,180;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,400;y,180;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,560;y,180;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,720;y,180;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,880;y,180;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,80;y,300;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,240;y,300;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,400;y,300;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,560;y,300;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,720;y,300;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,880;y,300;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,80;y,420;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,240;y,420;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,400;y,420;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,560;y,420;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,720;y,420;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(x,880;y,420;texcoordvelocity,-1,-1;rainbow)
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,0;linear,2.5;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,240;linear,3.5;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,360;linear,2;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,480;linear,3;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,160;y,640;linear,2.5;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,320;y,-160;linear,3.5;y,640;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,480;y,640;linear,2;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,640;y,-160;linear,3;y,640;effectclock,'beat';queuecommand,"On")
	};
};

return t;