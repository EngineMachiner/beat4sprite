return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("BGEffect.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	},
	
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;zoomto,1920,120;texcoordvelocity,1,0;customtexturerect,0,0,3,1;blend,'BlendMode_Add')
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,320;y,120;texcoordvelocity,-1,0;customtexturerect,0,0,3,1;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,160;y,240;texcoordvelocity,1,0;customtexturerect,0,0,3,1;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-320;y,360;texcoordvelocity,-1,0;customtexturerect,0,0,3,1;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-160;y,480;texcoordvelocity,1,0;customtexturerect,0,0,3,1;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;texcoordvelocity,0,-1;customtexturerect,0,0,1,2;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,320;y,SCREEN_CENTER_Y;texcoordvelocity,0,-1;customtexturerect,0,0,1,2;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,160;y,SCREEN_CENTER_Y;texcoordvelocity,0,1;customtexturerect,0,0,1,2;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,-320;y,SCREEN_CENTER_Y;texcoordvelocity,0,-0.75;customtexturerect,0,0,1,2;blend,'BlendMode_Add';diffusealpha,0.5)
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,-160;y,SCREEN_CENTER_Y;texcoordvelocity,0,1;customtexturerect,0,0,1,2;blend,'BlendMode_Add';diffusealpha,0.5)
	};

}