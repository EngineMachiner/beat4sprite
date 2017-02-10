local t = Def.ActorFrame{
	LoadActor("3 2x1")..{
		OnCommand=cmd()
	};
};

return t;