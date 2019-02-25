local file = "/BGAnimations/Sprites/" .. (...)

local ScaleVar = _screen.h/480

local ZoomValue = {
	
	0.5*ScaleVar,
	0.75*ScaleVar,
	1*ScaleVar,
	
}


return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,
	
			Def.Sprite{
		Texture = file,
          RepeatCommand=function(self)
		  
		  	if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
			
			numDelay = self:GetNumStates()
			
		  self:effectclock("beat"):set_tween_uses_effect_delta(true)
		  :zoom(ZoomValue[math.random(1,3)]):SetAllStateDelays(1/numDelay)
		  :x(math.random(0, _screen.w))
		  :y(math.random(0, _screen.h)
		  :sleep(2)
		  :zoom(ZoomValue[math.random(1,3)])
		  :x(math.random(0, _screen.w))
		  :y(math.random(0, _screen.h))
		  :setstate(math.random(0,1)):queuecommand("Repeat");
		  
		  
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;effectclock,"beat";set_tween_uses_effect_delta,true;x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
	
}