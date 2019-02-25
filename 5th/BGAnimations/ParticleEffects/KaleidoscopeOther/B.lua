local WDX2 if SCREEN_WIDTH > 640 then WDX2 = 80/2 else WDX2 = 0 end;
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("2.lua")..{
		OnCommand=cmd(addx,WDX2)
	};
	LoadActor("2.lua")..{
		OnCommand=cmd(x,250;y,-65;addx,WDX2)
	};
	LoadActor("2.lua")..{
		OnCommand=cmd(x,-250;y,65;addx,WDX2)
	};
}