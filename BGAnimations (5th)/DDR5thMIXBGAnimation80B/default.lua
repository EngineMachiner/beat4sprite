local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(x,160;y,120)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,480;y,120)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,800;y,120)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,1120;y,120)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,160;y,360)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,480;y,360)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,800;y,360)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,1120;y,360)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,160;y,600)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,480;y,600)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,800;y,600)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,1120;y,600)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationx,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y;rotationx,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationx,180)
	};
};

return t;