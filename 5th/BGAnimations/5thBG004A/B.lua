local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "/BGAnimations/Backgrounds/fallback.png"
		end;
local ScaleVar = ...

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;bob;effectperiod,2;effectmagnitude,4,2.015625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;bob;effectperiod,2;effectmagnitude,8,4.015625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.03125;cropbottom,0.03125;cropleft,0.03125;cropright,0.03125;bob;effectperiod,2;effectmagnitude,12,6.03125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.0625;cropbottom,0.0625;cropleft,0.0625;cropright,0.0625;bob;effectperiod,2;effectmagnitude,16,8.0625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.09375;cropbottom,0.09375;cropleft,0.09375;cropright,0.09375;bob;effectperiod,2;effectmagnitude,20,10.09375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.125;cropbottom,0.125;cropleft,0.125;cropright,0.125;bob;effectperiod,2;effectmagnitude,24,12.125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.15625;cropbottom,0.15625;cropleft,0.15625;cropright,0.15625;bob;effectperiod,2;effectmagnitude,28,14.15625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.1875;cropbottom,0.1875;cropleft,0.1875;cropright,0.1875;bob;effectperiod,2;effectmagnitude,32,16.1875,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.21875;cropbottom,0.21875;cropleft,0.21875;cropright,0.21875;bob;effectperiod,2;effectmagnitude,36,18.21875,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.25;cropbottom,0.25;cropleft,0.25;cropright,0.25;bob;effectperiod,2;effectmagnitude,40,20.25,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.28125;cropbottom,0.28125;cropleft,0.28125;cropright,0.28125;bob;effectperiod,2;effectmagnitude,44,22.28125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.3125;cropbottom,0.3125;cropleft,0.3125;cropright,0.3125;bob;effectperiod,2;effectmagnitude,48,24.3125,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.34375;cropbottom,0.34375;cropleft,0.34375;cropright,0.34375;bob;effectperiod,2;effectmagnitude,52,26.34375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.375;cropbottom,0.375;cropleft,0.375;cropright,0.375;bob;effectperiod,2;effectmagnitude,56,28.375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.40625;cropbottom,0.40625;cropleft,0.40625;cropright,0.40625;bob;effectperiod,2;effectmagnitude,60,30.40625,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.4375;cropbottom,0.4375;cropleft,0.4375;cropright,0.4375;bob;effectperiod,2;effectmagnitude,64,32.4375,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.46875;cropbottom,0.46875;cropleft,0.46875;cropright,0.46875;bob;effectperiod,2;effectmagnitude,68,34.46875,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;zoom,ScaleVar;croptop,0.49;cropbottom,0.49;cropleft,0.49;cropright,0.49;bob;effectperiod,2;effectmagnitude,72,36.5,0;effectclock,'beat';fadeleft,0.025;faderight,0.025)
	};
}