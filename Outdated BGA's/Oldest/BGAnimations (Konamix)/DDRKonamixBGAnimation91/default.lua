return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,160;y,120;customtexturerect,0,0,1,1;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3;effectclock,'beat')	
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,480;y,120;customtexturerect,0,0,1,1;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3;effectclock,'beat')	
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,160;y,360;customtexturerect,0,0,1,1;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3;effectclock,'beat')	
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(x,480;y,360;customtexturerect,0,0,1,1;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3;effectclock,'beat')	
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,64;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,192;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,320;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,448;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,576;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,704;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,832;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,960;y,64)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,64;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,192;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,320;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,448;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,576;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,704;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,832;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,960;y,192)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,64;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,192;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,320;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,448;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,576;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,704;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,832;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,960;y,320)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,64;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,192;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,320;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,448;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,576;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,704;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,832;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,960;y,448)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,64;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,192;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,320;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,448;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,576;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,704;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,832;y,576)
	};
	LoadActor("1 7x1")..{
		OnCommand=cmd(x,960;y,576)
	};
}