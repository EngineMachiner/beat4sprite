local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,15;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*6.75,-0.075*6.75;effectclock,'beat';customtexturerect,0,0,15,15;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0,effectcolor3,1,1,1,1;effectclock,'beat')
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