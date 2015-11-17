local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;sleep,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,320;y,60;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,960;y,60;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,320;y,180;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,960;y,180;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,320;y,300;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,960;y,300;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,320;y,420;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,960;y,420;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,320;y,540;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("2 1x2.png")..{
		OnCommand=cmd(x,960;y,540;hibernate,2;sleep,2;hibernate,2)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(Center;zoom,5;texcoordvelocity,0,-0.40;customtexturerect,0,0,5,5;sleep,2;hibernate,4)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;effectoffset,0.2;spin;effectmagnitude,0,90,0)
	};
	LoadActor("2 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,128;effectoffset,0.4;spin;effectmagnitude,0,90,0)
	};
	LoadActor("3 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,256;effectoffset,0.6;spin;effectmagnitude,0,90,0)
	};
	LoadActor("4 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,384;effectoffset,0.8;spin;effectmagnitude,0,90,0)
	};
	LoadActor("5 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,512;spin;effectmagnitude,0,90,0)
	};
	LoadActor("1 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,640;effectoffset,0.2;spin;effectmagnitude,0,90,0)
	};
	LoadActor("2 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,768;effectoffset,0.4;spin;effectmagnitude,0,90,0)
	};
	LoadActor("3 5x1")..{
		OnCommand=cmd(x,64;y,SCREEN_CENTER_Y;addx,896;effectoffset,0.4;spin;effectmagnitude,0,90,0)
	};
};

return t;