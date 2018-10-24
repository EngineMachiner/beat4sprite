local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,-320;linear,2;y,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,2;y,320;queuecommand,"On")
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