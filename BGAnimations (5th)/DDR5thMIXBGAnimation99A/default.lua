local t = Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationy,180;rotationx,-180)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationy,180;rotationx,-180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationx,180;rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationx,180;rotationy,180;rotationx,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;rotationx,180;rotationy,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;rotationx,180;rotationy,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationx,180;rotationy,180)
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(x,SCREEN_BOTTOM;y,SCREEN_BOTTOM;rotationx,180;rotationy,180)
	};
};

return t;