local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "../Backgrounds/fallback.png"
		end;
local ScaleVar = ...

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;wag;effectperiod,2;effectmagnitude,4,2.015625,2;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;wag;effectperiod,2;effectmagnitude,8,4.015625,4;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.03125;cropbottom,0.03125;cropleft,0.03125;cropright,0.03125;wag;effectperiod,2;effectmagnitude,12,6.03125,6;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.0625;cropbottom,0.0625;cropleft,0.0625;cropright,0.0625;wag;effectperiod,2;effectmagnitude,16,8.0625,8;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.09375;cropbottom,0.09375;cropleft,0.09375;cropright,0.09375;wag;effectperiod,2;effectmagnitude,20,10.09375,10;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.125;cropbottom,0.125;cropleft,0.125;cropright,0.125;wag;effectperiod,2;effectmagnitude,24,12.125,12;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.15625;cropbottom,0.15625;cropleft,0.15625;cropright,0.15625;wag;effectperiod,2;effectmagnitude,28,14.15625,14;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.1875;cropbottom,0.1875;cropleft,0.1875;cropright,0.1875;wag;effectperiod,2;effectmagnitude,32,16.1875,16;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.21875;cropbottom,0.21875;cropleft,0.21875;cropright,0.21875;wag;effectperiod,2;effectmagnitude,36,18.21875,18;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.25;cropbottom,0.25;cropleft,0.25;cropright,0.25;wag;effectperiod,2;effectmagnitude,40,20.25,20;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.28125;cropbottom,0.28125;cropleft,0.28125;cropright,0.28125;wag;effectperiod,2;effectmagnitude,44,22.28125,22;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.3125;cropbottom,0.3125;cropleft,0.3125;cropright,0.3125;wag;effectperiod,2;effectmagnitude,48,24.3125,24;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.34375;cropbottom,0.34375;cropleft,0.34375;cropright,0.34375;wag;effectperiod,2;effectmagnitude,52,26.34375,26;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.375;cropbottom,0.375;cropleft,0.375;cropright,0.375;wag;effectperiod,2;effectmagnitude,56,28.375,28;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.40625;cropbottom,0.40625;cropleft,0.40625;cropright,0.40625;wag;effectperiod,2;effectmagnitude,60,30.40625,30;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.4375;cropbottom,0.4375;cropleft,0.4375;cropright,0.4375;wag;effectperiod,2;effectmagnitude,64,32.4375,32;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.46875;cropbottom,0.46875;cropleft,0.46875;cropright,0.46875;wag;effectperiod,2;effectmagnitude,68,34.46875,34;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;fadetop,0.015625;fadebottom,0.015625;fadeleft,0.015625;faderight,0.015625;SetSize,640*ScaleVar,480*ScaleVar;croptop,0.49;cropbottom,0.49;cropleft,0.49;cropright,0.49;wag;effectperiod,2;effectmagnitude,72,36.5,36;effectclock,'beat')
	};
}