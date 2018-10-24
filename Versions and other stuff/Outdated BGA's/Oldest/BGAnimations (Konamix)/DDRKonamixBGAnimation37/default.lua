local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,-120)
	};
};

return t;