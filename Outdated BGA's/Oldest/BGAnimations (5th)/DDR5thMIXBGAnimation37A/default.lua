local t = Def.ActorFrame{
	LoadActor("1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,10;texcoordvelocity,0.25,0.25;customtexturerect,0,0,10,10;rainbow)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0;rotationy,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;rotationy,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0;rotationy,180)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0;rotationy,180)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;rotationy,180)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0;rotationy,180)
	};
};

return t;