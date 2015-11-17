local t = Def.ActorFrame{
	LoadActor("2 2x1")..{
		OnCommand=cmd()
	};
};

return t;