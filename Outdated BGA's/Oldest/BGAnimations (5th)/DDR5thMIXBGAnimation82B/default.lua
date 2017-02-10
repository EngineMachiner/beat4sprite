local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,0.1,0)
	};
};

return t;