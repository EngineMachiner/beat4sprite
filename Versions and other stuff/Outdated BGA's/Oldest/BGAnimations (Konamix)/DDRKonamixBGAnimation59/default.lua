local t = Def.ActorFrame{
	LoadActor("2.lua")..{
		OnCommand=cmd(diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat')
	};
};

return t;