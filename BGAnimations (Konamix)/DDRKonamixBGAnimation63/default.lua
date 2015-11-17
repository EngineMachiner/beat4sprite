local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,10;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0.075*1.75;effectclock,'beat';customtexturerect,0,0,10,10)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,64;y,60;effectclock,'beat';rainbow;effectoffset,0.1)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,192;y,60;effectclock,'beat';rainbow;effectoffset,0.2)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,320;y,60;effectclock,'beat';rainbow;effectoffset,0.3)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,448;y,60;effectclock,'beat';rainbow;effectoffset,0.4)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,576;y,60;effectclock,'beat';rainbow;effectoffset,0.5)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,704;y,60;effectclock,'beat';rainbow;effectoffset,0.6)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,832;y,60;effectclock,'beat';rainbow;effectoffset,0.7)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,64;y,180;effectclock,'beat';rainbow;effectoffset,0.8)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,192;y,180;effectclock,'beat';rainbow;effectoffset,0.9)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,320;y,180;effectclock,'beat';rainbow;effectoffset,1)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,448;y,180;effectclock,'beat';rainbow;effectoffset,1.1)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,576;y,180;effectclock,'beat';rainbow;effectoffset,1.2)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,704;y,180;effectclock,'beat';rainbow;effectoffset,1.3)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,832;y,180;effectclock,'beat';rainbow;effectoffset,1.4)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,64;y,300;effectclock,'beat';rainbow;effectoffset,1.5)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,192;y,300;effectclock,'beat';rainbow;effectoffset,1.6)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,320;y,300;effectclock,'beat';rainbow;effectoffset,1.7)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,448;y,300;effectclock,'beat';rainbow;effectoffset,1.8)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,576;y,300;effectclock,'beat';rainbow;effectoffset,1.9)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,704;y,300;effectclock,'beat';rainbow;effectoffset,2)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,832;y,300;effectclock,'beat';rainbow;effectoffset,2.1)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,64;y,420;effectclock,'beat';rainbow;effectoffset,2.2)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,192;y,420;effectclock,'beat';rainbow;effectoffset,2.3)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,320;y,420;effectclock,'beat';rainbow;effectoffset,2.4)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,448;y,420;effectclock,'beat';rainbow;effectoffset,2.5)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,576;y,420;effectclock,'beat';rainbow;effectoffset,2.6)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,704;y,420;effectclock,'beat';rainbow;effectoffset,2.7)
	};
	LoadActor("2 16x1.png")..{
		OnCommand=cmd(x,832;y,420;effectclock,'beat';rainbow;effectoffset,2.8)
	};
};

return t;