local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,480;linear,5;y,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,5;y,-480;queuecommand,"On")
	};
};

return t;