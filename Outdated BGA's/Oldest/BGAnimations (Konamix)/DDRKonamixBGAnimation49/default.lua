local t = Def.ActorFrame{
	LoadActor("1.lua")..{
		OnCommand=cmd(rainbow)
	};
};

return t;