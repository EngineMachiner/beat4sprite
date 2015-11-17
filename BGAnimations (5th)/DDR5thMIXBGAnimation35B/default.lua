local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(x,0;y,0;linear,3;x,-248;y,-232;queuecommand,"On")
	};
	LoadActor("2")..{
		OnCommand=cmd(x,248)
	};
};

return t;