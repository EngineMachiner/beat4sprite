return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,7;customtexturerect,0,0,7,7;diffuseramp,effectcolor1,1,1,1,1,effectcolor2,0,0,0,0;effectclock,'beat')
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,0;zoomto,1920,120;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1;blend,"BlendMode_Add")
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,320;y,120;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1;blend,"BlendMode_Add")
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,160;y,240;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1;blend,"BlendMode_Add")
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-320;y,360;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1;blend,"BlendMode_Add")
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;zoomto,1920,120;;addx,-160;y,480;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0.075*1.75,0;effectclock,'beat';customtexturerect,0,0,3,1;blend,"BlendMode_Add")
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2;blend,"BlendMode_Add")
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,320;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2;blend,"BlendMode_Add")
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,160;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2;blend,"BlendMode_Add")
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,-320;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2;blend,"BlendMode_Add")
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;zoomto,160,960;addx,-160;y,SCREEN_CENTER_Y;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*1.75;effectclock,'beat';customtexturerect,0,0,1,2;blend,"BlendMode_Add")
	};
}