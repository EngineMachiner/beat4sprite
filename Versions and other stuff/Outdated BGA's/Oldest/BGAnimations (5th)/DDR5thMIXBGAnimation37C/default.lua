local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,10;rainbow;texcoordvelocity,0.25,0.25;customtexturerect,0,0,10,10)
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,0;linear,3.5;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,240;linear,2.5;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,-320;y,360;linear,3;x,1184;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,1184;y,480;linear,2;x,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,160;y,640;linear,3.5;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,320;y,-160;linear,2.5;y,640;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,480;y,640;linear,3;y,-160;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("sprite1")..{
		OnCommand=cmd(x,640;y,-160;linear,2;y,640;effectclock,'beat';queuecommand,"On")
	};
};

return t;