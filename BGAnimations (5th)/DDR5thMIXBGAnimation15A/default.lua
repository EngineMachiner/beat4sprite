local t = Def.ActorFrame{
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,80;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,240;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,400;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,560;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,720;y,SCREEN_CENTER_Y)
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,880;y,SCREEN_CENTER_Y)
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