local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,80;y,80;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,240;y,80;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,400;y,80;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,560;y,80;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,80;y,240;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,240;y,240;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,400;y,240;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,560;y,240;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,80;y,400;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,240;y,400;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,400;y,400;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,560;y,400;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,720;y,80;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,880;y,80;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,720;y,240;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,880;y,240;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,720;y,400;texcoordvelocity,0,1)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(x,880;y,400;texcoordvelocity,0,1)
	};
	LoadActor("_particleLoader1.lua")..{
		OnCommand=cmd()
	};
	LoadActor("_particleLoader1 - copia.lua")..{
		OnCommand=cmd(rotationy,180;x,640;y,0)
	};
	LoadActor("_particleLoader2.lua")..{
		OnCommand=cmd(rotationx,180;x,0;y,480)
	};
	LoadActor("_particleLoader2 - copia.lua")..{
		OnCommand=cmd(rotationy,-180;rotationx,180;x,640;y,480)
	};
};

return t;