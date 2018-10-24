local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,-320;linear,2;y,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,2;y,320;queuecommand,"On")
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_TOP;y,0;rotationy,180)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;rotationy,180)
	};
	LoadActor("_particleLoader.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,0;rotationy,180)
	};
};

return t;