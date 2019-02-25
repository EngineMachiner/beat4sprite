local WDX2 if SCREEN_WIDTH > 640 then WDX2 = -58/8 else WDX2 = 0 end
local ScaleVar = _screen.h/480
local file = "../Sprites/3 5x1.png"
local file2 = "../Sprites/2 5x1.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,0;rainbow;effectoffset,0.1;effectperiod,4;x,ScaleVar*62;y,ScaleVar*58;addx,ScaleVar*WDX2;effectclock,"beat")
	};
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,1;rainbow;effectoffset,0.2;effectperiod,4;x,ScaleVar*62*4;y,ScaleVar*58;addx,ScaleVar*WDX2;effectclock,"beat")
	};
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,2;rainbow;effectoffset,0.3;effectperiod,4;x,ScaleVar*62*7;y,ScaleVar*58;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,3;rainbow;effectoffset,0.4;effectperiod,4;x,ScaleVar*62*10;y,ScaleVar*58;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,4;rainbow;effectoffset,0.4;effectperiod,4;x,ScaleVar*62*13;y,ScaleVar*58;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
	--
	
		Def.Sprite{
		Texture = file2, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,0;rainbow;effectoffset,0.5;effectperiod,4;x,ScaleVar*62;y,ScaleVar*58*4;addx,ScaleVar*WDX2;effectclock,"beat")
	};
		Def.Sprite{
		Texture = file2, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,1;rainbow;effectoffset,0.6;effectperiod,4;x,ScaleVar*62*4;y,ScaleVar*58*4;addx,ScaleVar*WDX2;effectclock,"beat")
	};
		Def.Sprite{
		Texture = file2, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,2;rainbow;effectoffset,0.7;effectperiod,4;x,ScaleVar*62*7;y,ScaleVar*58*4;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
		Def.Sprite{
		Texture = file2,
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,3;rainbow;effectoffset,0.8;effectperiod,4;x,ScaleVar*62*10;y,ScaleVar*58*4;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
		Def.Sprite{
		Texture = file2, 

			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,4;rainbow;effectoffset,0.9;effectperiod,4;x,ScaleVar*62*13;y,ScaleVar*58*4;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
--

		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,4;rainbow;effectoffset,1;effectperiod,4;x,ScaleVar*62;y,ScaleVar*58*7;addx,ScaleVar*WDX2;effectclock,"beat")
	};
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,3;rainbow;effectoffset,1.1;effectperiod,4;x,ScaleVar*62*4;y,ScaleVar*58*7;addx,ScaleVar*WDX2;effectclock,"beat")
	};
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,0;rainbow;effectoffset,1.2;effectperiod,4;x,ScaleVar*62*7;y,ScaleVar*58*7;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,1;rainbow;effectoffset,1.3;effectperiod,4;x,ScaleVar*62*10;y,ScaleVar*58*7;addx,ScaleVar*WDX2;effectclock,"beat")
	};
	
		Def.Sprite{
		Texture = file, 
			OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates();zoom,ScaleVar;setstate,2;rainbow;effectoffset,1.4;effectperiod,4;x,ScaleVar*62*13;y,ScaleVar*58*7;addx,ScaleVar*WDX2;effectclock,"beat")
	};
}