local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,-488;linear,3;y,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,3;y,488;queuecommand,"On")
	};
};

return t;