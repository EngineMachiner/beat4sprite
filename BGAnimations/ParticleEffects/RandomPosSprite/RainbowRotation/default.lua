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
					  
		  self:setstate(numStates):SetAllStateDelays(1/numDelay)
		  :effectclock("beat"):set_tween_uses_effect_delta(true)
		  :rainbow():effectoffset(0.1):effectperiod(8)
		  :zoom(ZoomValue[math.random(1,3)]):rotationz(math.random(0,360)):x(math.random(0, _screen.w)):y(math.random(0, _screen.h)):sleep(2)
		  :zoom(ZoomValue[math.random(1,3)]):rotationz(math.random(0,360)):x(math.random(0, _screen.w)):y(math.random(0, _screen.h)):queuecommand("Repeat");
		  end;
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.2;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.3;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.4;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.5;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.6;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.7;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.8;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},

			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,0.9;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;rainbow;effectperiod,8;effectoffset,1;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;SetAllStateDelays,(1/numDelay);rainbow;effectperiod,8;effectoffset,1.1;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;SetAllStateDelays,(1/numDelay);rainbow;effectperiod,8;effectoffset,1.2;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;SetAllStateDelays,(1/numDelay);rainbow;effectperiod,8;effectoffset,1.3;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;SetAllStateDelays,(1/numDelay);rainbow;effectperiod,8;effectoffset,1.4;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
			Def.Sprite{
		Texture = file, 
          RepeatCommand=cmd(zoom,ZoomValue[math.random(1,3)];setstate,numStates;SetAllStateDelays,(1/numDelay);effectclock,"beat";set_tween_uses_effect_delta,true;SetAllStateDelays,(1/numDelay);rainbow;effectperiod,8;effectoffset,1.5;rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);sleep,2;zoom,ZoomValue[math.random(1,3)];rotationz,math.random(0,360);x,math.random(0, _screen.w);y,math.random(0, _screen.h);  queuecommand,"Repeat");
	},
	
}