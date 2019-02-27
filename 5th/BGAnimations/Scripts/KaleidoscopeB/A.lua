local WDX2 if SCREEN_WIDTH > 640 then WDX2 = 80/2 else WDX2 = 0 end;
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240-(139*4));x,(430-(238*4)))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240-(139*3));x,(430-(238*3)))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240-(139*2));x,(430-(238*2)))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240-139);x,(430-238))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,240;x,430)
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240+(139*1));x,(430+(238*1)))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240+(139*2));x,(430+(238*2)))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240+(139*3));x,(430+(238*3)))
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(addx,WDX2;y,(240+(139*4));x,(430+(238*4)))
	};
}