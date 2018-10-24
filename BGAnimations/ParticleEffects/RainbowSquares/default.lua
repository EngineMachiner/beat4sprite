local ScaleVar = _screen.h/480
local size_x, size_y = ...

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.1*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.2*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.3*4;effectperiod,6;blend,"BlendMode_Modulate")
	};	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.4*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*3;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.2*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*3;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.3*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*3;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.4*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*3;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.5*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*5;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.3*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*5;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.4*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*5;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.5*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*5;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.6*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*7;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.4*4;effectperiod,6;blend,"BlendMode_Modulate")
	};	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*7;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.5*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*7;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.6*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*7;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.7*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*9;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.5*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*9;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.6*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*9;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.7*4;effectperiod,6;blend,"BlendMode_Modulate")
	};	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*9;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.8*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*11;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.6*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*11;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.7*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*11;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.8*4;effectperiod,6;blend,"BlendMode_Modulate")
	};	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*11;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.9*4;effectperiod,6;blend,"BlendMode_Modulate")
	};

		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*13;y,ScaleVar*size_y/2;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.7*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*13;y,ScaleVar*size_y/2*3;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.8*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*13;y,ScaleVar*size_y/2*5;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-0.9*4;effectperiod,6;blend,"BlendMode_Modulate")
	};	
		Def.Quad{
		OnCommand=cmd(x,ScaleVar*size_x/2*13;y,ScaleVar*size_y/2*7;SetSize,size_x*ScaleVar,size_y*ScaleVar;effectclock,"beat";rainbow;effectoffset,-1*4;effectperiod,6;blend,"BlendMode_Modulate")
	};
}