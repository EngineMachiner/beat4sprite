local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(x,160;linear,3;x,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(x,0;linear,3;x,-160;queuecommand,"On")
	};
};

return t;