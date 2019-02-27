local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "/BGAnimations/Backgrounds/fallback.png"
		end;
		
local ScaleVar = _screen.h/480
		
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;pulse;effectperiod,2;effectmagnitude,1,1.015625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;pulse;effectperiod,2;effectmagnitude,1,1.015625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.03125;cropbottom,0.03125;cropleft,0.03125;cropright,0.03125;pulse;effectperiod,2;effectmagnitude,1,1.03125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.0625;cropbottom,0.0625;cropleft,0.0625;cropright,0.0625;pulse;effectperiod,2;effectmagnitude,1,1.0625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.09375;cropbottom,0.09375;cropleft,0.09375;cropright,0.09375;pulse;effectperiod,2;effectmagnitude,1,1.09375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.125;cropbottom,0.125;cropleft,0.125;cropright,0.125;pulse;effectperiod,2;effectmagnitude,1,1.125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.15625;cropbottom,0.15625;cropleft,0.15625;cropright,0.15625;pulse;effectperiod,2;effectmagnitude,1,1.15625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.1875;cropbottom,0.1875;cropleft,0.1875;cropright,0.1875;pulse;effectperiod,2;effectmagnitude,1,1.1875,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.21875;cropbottom,0.21875;cropleft,0.21875;cropright,0.21875;pulse;effectperiod,2;effectmagnitude,1,1.21875,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.25;cropbottom,0.25;cropleft,0.25;cropright,0.25;pulse;effectperiod,2;effectmagnitude,1,1.25,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.28125;cropbottom,0.28125;cropleft,0.28125;cropright,0.28125;pulse;effectperiod,2;effectmagnitude,1,1.28125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.3125;cropbottom,0.3125;cropleft,0.3125;cropright,0.3125;pulse;effectperiod,2;effectmagnitude,1,1.3125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.34375;cropbottom,0.34375;cropleft,0.34375;cropright,0.34375;pulse;effectperiod,2;effectmagnitude,1,1.34375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.375;cropbottom,0.375;cropleft,0.375;cropright,0.375;pulse;effectperiod,2;effectmagnitude,1,1.375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.40625;cropbottom,0.40625;cropleft,0.40625;cropright,0.40625;pulse;effectperiod,2;effectmagnitude,1,1.40625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.4375;cropbottom,0.4375;cropleft,0.4375;cropright,0.4375;pulse;effectperiod,2;effectmagnitude,1,1.4375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.46875;cropbottom,0.46875;cropleft,0.46875;cropright,0.46875;pulse;effectperiod,2;effectmagnitude,1,1.46875,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640,480;croptop,0.49;cropbottom,0.49;cropleft,0.49;cropright,0.49;pulse;effectperiod,2;effectmagnitude,1,1.5,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
}