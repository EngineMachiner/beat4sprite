local t = Def.ActorFrame{
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,-320;linear,2;y,0;queuecommand,"On")
	};
	LoadActor("sprite1.lua")..{
		OnCommand=cmd(y,0;linear,2;y,320;queuecommand,"On")
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