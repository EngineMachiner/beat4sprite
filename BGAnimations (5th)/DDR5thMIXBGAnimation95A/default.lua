local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y;rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_LEFT;y,SCREEN_CENTER_Y;rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationx,180)
	};
};

return t;