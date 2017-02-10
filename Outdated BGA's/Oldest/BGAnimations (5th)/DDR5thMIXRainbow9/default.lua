local Color1 = color("0,0,1,1");
local t = Def.ActorFrame{
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(diffuse,Color1)
	};
};

return t;