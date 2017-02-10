local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,10;rainbow;texcoordvelocity,0.25,0.25;customtexturerect,0,0,10,10)
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