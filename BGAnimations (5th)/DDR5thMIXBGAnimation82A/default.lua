local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;texcoordvelocity,0.2,0)
	};
};

return t;