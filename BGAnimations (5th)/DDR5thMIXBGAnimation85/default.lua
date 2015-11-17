local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0)
	};
	LoadActor("_particleLoader - copia.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0;rotationy,180)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0)
	};
	LoadActor("_particleLoader - copia.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;rotationy,180)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0)
	};
	LoadActor("_particleLoader - copia.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0;rotationy,180)
	};
};

return t;