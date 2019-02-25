local file, file2, line_delay, ScaleVar = ...


return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,
	
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
			numDelay = self:GetNumStates()
		self:zoom(ScaleVar):x(SCREEN_LEFT-self:GetWidth()*ScaleVar)
		:y(SCREEN_TOP)
		:linear(5)
		:x(SCREEN_RIGHT+self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):x(SCREEN_RIGHT+self:GetWidth()*ScaleVar):sleep(0.5)
		:y(SCREEN_TOP+self:GetHeight()*ScaleVar)
		:linear(5)
		:x(SCREEN_LEFT-self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):x(SCREEN_LEFT-self:GetWidth()*ScaleVar)
		:y(SCREEN_TOP+self:GetHeight()*ScaleVar*2):sleep(1)
		:linear(5)
		:x(SCREEN_RIGHT+self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):x(SCREEN_RIGHT+self:GetWidth()*ScaleVar)
		:y(SCREEN_TOP+self:GetHeight()*ScaleVar*3):sleep(1.5*2)
		:linear(5)
		:x(SCREEN_LEFT-self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):x(SCREEN_LEFT-self:GetWidth()*ScaleVar):sleep(2)
		:y(SCREEN_TOP+self:GetHeight()*ScaleVar*4)
		:linear(5)
		:x(SCREEN_RIGHT+self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
--

		Def.Sprite{
		Texture = file2,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):y(SCREEN_TOP-self:GetHeight()*ScaleVar)
		:x(SCREEN_LEFT+self:GetWidth()*ScaleVar*0)
		:linear(4)
		:y(SCREEN_BOTTOM+self:GetHeight()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file2,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):y(SCREEN_BOTTOM+self:GetWidth()*ScaleVar)
		:x(SCREEN_LEFT+self:GetWidth()*ScaleVar*1)
		:linear(4)
		:y(SCREEN_TOP-self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file2,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):y(SCREEN_TOP-self:GetWidth()*ScaleVar)
		:x(SCREEN_LEFT+self:GetWidth()*ScaleVar*2):sleep(1)
		:linear(4)
		:y(SCREEN_BOTTOM+self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file2,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):y(SCREEN_BOTTOM+self:GetWidth()*ScaleVar):sleep(0.5)
		:x(SCREEN_LEFT+self:GetWidth()*ScaleVar*3)
		:linear(4)
		:y(SCREEN_TOP-self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
	
		Def.Sprite{
		Texture = file2,
		OnCommand=function(self)
			if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;
		self:zoom(ScaleVar):y(SCREEN_TOP-self:GetWidth()*ScaleVar):sleep(1*2)
		:x(SCREEN_LEFT+self:GetWidth()*ScaleVar*4)
		:linear(4)
		:y(SCREEN_BOTTOM+self:GetWidth()*ScaleVar)
		:set_tween_uses_effect_delta(true):effectclock("beat"):SetAllStateDelays(line_delay):setstate(numStates)
		:queuecommand("On")
		end;
	};
}