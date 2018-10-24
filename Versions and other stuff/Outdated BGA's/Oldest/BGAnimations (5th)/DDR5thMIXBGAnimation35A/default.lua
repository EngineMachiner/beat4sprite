local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,3;y,-460;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,460;linear,3;y,0;queuecommand,"On")
	};
};

return t;