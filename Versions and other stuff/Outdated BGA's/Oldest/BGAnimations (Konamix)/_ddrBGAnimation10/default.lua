local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(rainbow;effectclock,'music')
	};
};

return t;