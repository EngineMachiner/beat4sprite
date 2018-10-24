local ScaleVar = ...
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	
	LoadActor("Circle4")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#ff0000")):rainbow():effectoffset(0):effectperiod(8)
		:zoom(ScaleVar*1.5)
		:linear(0.5)
		:zoom(ScaleVar*1.75)
		:linear(0.5)
		:zoom(ScaleVar*2)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#ffa500")):rainbow():effectoffset(0.125):effectperiod(8)
		:zoom(ScaleVar*1.25)
		:linear(0.5)
		:zoom(ScaleVar*1.5)
		:linear(0.5)
		:zoom(ScaleVar*1.75)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle4")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#ffff00")):rainbow():effectoffset(0.125*2):effectperiod(8)
		:zoom(ScaleVar*1)
		:linear(0.5)
		:zoom(ScaleVar*1.25)
		:linear(0.5)
		:zoom(ScaleVar*1.5)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#ffff00")):rainbow():effectoffset(0.125*3):effectperiod(8)
		:zoom(ScaleVar*0.75)
		:linear(0.5)
		:zoom(ScaleVar*1)
		:linear(0.5)
		:zoom(ScaleVar*1.25)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle4")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#00ffff")):rainbow():effectoffset(0.125*4):effectperiod(8)
		:zoom(ScaleVar*0.5)
		:linear(0.5)
		:zoom(ScaleVar*0.75)
		:linear(0.5)
		:zoom(ScaleVar*1)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#0000ff")):rainbow():effectoffset(0.125*5):effectperiod(8)
		:zoom(ScaleVar*0.25)
		:linear(0.5)
		:zoom(ScaleVar*0.5)
		:linear(0.5)
		:zoom(ScaleVar*0.75)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};	
	
	LoadActor("Circle4")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#800080")):rainbow():effectoffset(0.125*6):effectperiod(8)
		:zoom(ScaleVar*0)
		:linear(0.5)
		:zoom(ScaleVar*0.25)
		:linear(0.5)
		:zoom(ScaleVar*0.5)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:diffuse(color("#ffc0cb")):rainbow():effectoffset(0.125*7):effectperiod(8)
		:zoom(ScaleVar*0)
		:linear(0.5)
		:zoom(ScaleVar*0)
		:linear(0.5)
		:zoom(ScaleVar*0.25)
		:set_tween_uses_effect_delta(true):effectclock("beat")
		:queuecommand("On")
		end
	};
	
}