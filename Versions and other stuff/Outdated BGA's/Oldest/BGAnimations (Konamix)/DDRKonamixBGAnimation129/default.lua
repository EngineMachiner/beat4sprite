local t = Def.ActorFrame{
	LoadActor("RepeatFirstSP")..{
		OnCommand=cmd()
	};
};

return t;