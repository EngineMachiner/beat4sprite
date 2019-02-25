local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{
		OnCommand=cmd(rainbow;effectperiod,8;effectoffset,0.6;effectclock,"beat")
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(rainbow;effectperiod,8;effectoffset,0.7;effectclock,"beat")
	};	
	LoadActor("C.lua")..{
		OnCommand=cmd(rainbow;effectperiod,8;effectoffset,0.8;effectclock,"beat")
	};	
	LoadActor("D.lua")..{
		OnCommand=cmd(rainbow;effectperiod,8;effectoffset,0.9;effectclock,"beat")
	};
	
	LoadActor("A.lua")..{
		OnCommand=cmd(x,128*ScaleVar*4;rainbow;effectperiod,8;effectoffset,1;effectclock,"beat")
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(x,128*ScaleVar*4;rainbow;effectperiod,8;effectoffset,1.1;effectclock,"beat")
	};	
	
	
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-128*ScaleVar*4;rainbow;effectperiod,8;effectoffset,0.2;effectclock,"beat")
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(x,-128*ScaleVar*4;rainbow;effectperiod,8;effectoffset,0.3;effectclock,"beat")
	};		
	LoadActor("C.lua")..{
		OnCommand=cmd(x,-128*ScaleVar*4;rainbow;effectperiod,8;effectoffset,0.4;effectclock,"beat")
	};	
	LoadActor("D.lua")..{
		OnCommand=cmd(x,-128*ScaleVar*4;rainbow;effectperiod,8;effectoffset,0.5;effectclock,"beat")
	};		
	
	LoadActor("D.lua")..{
		OnCommand=cmd(x,-128*ScaleVar*8;rainbow;effectperiod,8;effectoffset,0.1;effectclock,"beat")
	};		
}