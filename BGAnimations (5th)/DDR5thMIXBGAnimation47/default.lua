local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd()
	};
	LoadActor("3")..{
		OnCommand=cmd(x,300)
	};
	LoadActor("3")..{
		OnCommand=cmd(x,-280)
	};
};

return t;