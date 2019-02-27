local file, delay =  ...
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,
	
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*60)
		:zoom(0):sleep((7.75+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((7.75+14)/15.75):linear(4.25/12):zoom(0):sleep((8+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*60)
		:zoom(0):sleep((7.5+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((7.5+14)/15.75):linear(4.25/12):zoom(0):sleep((8.25+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*60)
		:zoom(0):sleep((7.25+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((7.25+14)/15.75):linear(4.25/12):zoom(0):sleep((8.5+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*60)
		:zoom(0):sleep((7+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((7+14)/15.75):linear(4.25/12):zoom(0):sleep((8.75+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*60*3)
		:zoom(0):sleep((6.75+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((6.75+14)/15.75):linear(4.25/12):zoom(0):sleep((9+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*(60+240))
		:zoom(0):sleep((6.5+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((6.5+14)/15.75):linear(4.25/12):zoom(0):sleep((9.25+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*(60+360))
		:zoom(0):sleep((6.25+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((6.25+14)/15.75):linear(4.25/12):zoom(0):sleep((9.5+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*(60+360))
		:zoom(0):sleep((6+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((6+14)/15.75):linear(4.25/12):zoom(0):sleep((9.75+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*(60+360))
		:zoom(0):sleep((5.75+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((5.75+14)/15.75):linear(4.25/12):zoom(0):sleep((10+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*(60+360))
		:zoom(0):sleep((5.5+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((5.5+14)/15.75):linear(4.25/12):zoom(0):sleep((10.25+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*(60+240))
		:zoom(0):sleep((5.25+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((5.25+14)/15.75):linear(4.25/12):zoom(0):sleep((10.5+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*60*3)
		:zoom(0):sleep((5+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((5+14)/15.75):linear(4.25/12):zoom(0):sleep((10.75+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*60*3)
		:zoom(0):sleep((4.75+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((4.75+14)/15.75):linear(4.25/12):zoom(0):sleep((11+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*60*3)
		:zoom(0):sleep((4.5+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((4.5+14)/15.75):linear(4.25/12):zoom(0):sleep((11.25+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*(60+240))
		:zoom(0):sleep((4.25+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((4.25+14)/15.75):linear(4.25/12):zoom(0):sleep((11.5+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*(60+240))
		:zoom(0):sleep((4+14)/15.75):linear(4.25/12):zoom(ScaleVar):sleep((4+14)/15.75):linear(4.25/12):zoom(0):sleep((11.75+4.25)/10):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat'):SetAllStateDelays(delay)
		end
	};
}