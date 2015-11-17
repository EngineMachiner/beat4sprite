local t = Def.ActorFrame{
	LoadActor("2 4x3")..{
		OnCommand=cmd()
	};
};

return t;