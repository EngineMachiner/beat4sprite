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
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;bob;effectperiod,1;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.0625;bob;effectperiod,1;effectmagnitude,10,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.125;bob;effectperiod,1;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.1875;bob;effectperiod,1;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.25;bob;effectperiod,1;effectmagnitude,40,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.3125;bob;effectperiod,1;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.375;bob;effectperiod,1;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.4375;bob;effectperiod,1;effectmagnitude,10,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.5;bob;effectperiod,1;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.5625;bob;effectperiod,1;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.625;bob;effectperiod,1;effectmagnitude,40,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.6875;bob;effectperiod,1;effectmagnitude,30,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.75;bob;effectperiod,1;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.8125;bob;effectperiod,1;effectmagnitude,10,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.875;bob;effectperiod,1;effectmagnitude,20,0,0;effectclock,'beat')
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;fadeleft,0.125;faderight,0.125;croptop,0.9375;bob;effectperiod,1;effectmagnitude,30,0,0;effectclock,'beat')
	};
}