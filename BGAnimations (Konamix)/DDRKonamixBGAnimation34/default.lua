local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd()
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,160)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,320)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,160)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,320)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationy,180;x,640;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(rotationx,180;x,0;y,480)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(rotationy,-180;rotationx,180;x,640;y,480)
	};
};

return t;