local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(x,320;y,240)
	};
	LoadActor("1")..{
		OnCommand=cmd(x,320;addx,640;y,240)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,SCREEN_BOTTOM;rotationx,180)
	};
	LoadActor("_particleLoader - copia.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,SCREEN_BOTTOM;rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;rotationx,180)
	};
	LoadActor("_particleLoader - copia.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_BOTTOM;rotationx,180)
	};
	LoadActor("_particleLoader - copia.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_BOTTOM;rotationy,180;rotationx,180)
	};
};

return t;