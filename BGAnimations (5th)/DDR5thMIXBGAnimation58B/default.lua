local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,2;texcoordvelocity,0,0.5;customtexturerect,0,0,2,2;rainbow)
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd()
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd(hibernate,5)
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd(hibernate,10)
	};
	LoadActor("Particle2x1")..{
		OnCommand=cmd(hibernate,15)
	};
};

return t;