local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd()
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(x,1280)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(x,1280;y,480)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(y,480)
	};
};

return t;