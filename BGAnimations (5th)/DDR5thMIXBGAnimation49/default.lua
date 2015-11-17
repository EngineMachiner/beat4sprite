local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,-480;linear,3;y,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,3;y,480;queuecommand,"On")
	};
};

return t;