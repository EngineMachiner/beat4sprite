local t = Def.ActorFrame{
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,64;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,192;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,320;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,448;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,576;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,704;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,832;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,960;y,64;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,64;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,192;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,320;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,448;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,576;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,704;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,832;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,960;y,192;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,64;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,192;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,320;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,448;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,576;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,704;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,832;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,960;y,320;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,64;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,192;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,320;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,448;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,576;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,704;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,832;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,960;y,448;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,64;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,192;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,320;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,448;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,576;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,704;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,832;y,576;effectclock,'beat')
	};
	LoadActor("1 5x3")..{
		OnCommand=cmd(x,960;y,576;effectclock,'beat')
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationy,180;x,640;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(rotationx,180;x,0;y,480)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(rotationy,-180;rotationx,180;x,640;y,480)
	};
};

return t;