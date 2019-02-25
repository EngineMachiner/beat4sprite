local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "../Backgrounds/fallback.png"
		end;
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;pulse;effectperiod,2;effectmagnitude,1.0625,1,0;effectperiod,2)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;cropbottom,0.5;cropright,0.5;pulse;effectperiod,2;effectmagnitude,1.0325,1,0;effectperiod,2;effectclock,'beat';diffusealpha,0.5;faderight,0.0625;fadebottom,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;croptop,0.5;cropleft,0.5;pulse;effectperiod,2;effectmagnitude,1.0325,1,0;effectperiod,2;effectclock,'beat';diffusealpha,0.5;fadetop,0.0625;fadeleft,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;cropbottom,0.5;cropleft,0.5;pulse;effectperiod,2;effectmagnitude,1.0325,1,0;effectperiod,2;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;fadeleft,0.0625;fadebottom,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;croptop,0.5;cropright,0.5;pulse;effectperiod,2;effectmagnitude,1.0325,1,0;effectperiod,2;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;faderight,0.0625;fadetop,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;cropbottom,0.5;cropright,0.5;pulse;effectperiod,2;effectmagnitude,1.0325,1,0;effectperiod,2;effectclock,'beat';diffusealpha,0.5;faderight,0.0625;fadebottom,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;croptop,0.5;cropleft,0.5;pulse;effectperiod,2;effectmagnitude,1.0625,1,0;effectperiod,2;effectclock,'beat';diffusealpha,0.5;fadetop,0.0625;fadeleft,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;cropbottom,0.5;cropleft,0.5;pulse;effectperiod,2;effectmagnitude,1.0625,1,0;effectperiod,2;effectclock,'beat';effectoffset,0.5;diffusealpha,0.25;fadeleft,0.0625;fadebottom,0.0625)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;croptop,0.5;cropright,0.5;pulse;effectperiod,2;effectmagnitude,1.0625,1,0;effectperiod,2;effectclock,'beat';effectoffset,0.5;diffusealpha,0.25;faderight,0.0625;fadetop,0.0625)
	};
}