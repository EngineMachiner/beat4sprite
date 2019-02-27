local file = 

...
return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,
	
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80)
		:y(60)
		:zoom(0):sleep(4/8):linear(4.25/10):zoom(1):sleep(4/8):linear(4.25/10):zoom(0):sleep((11.75+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+160)
		:y(60)
		:zoom(0):sleep(4.25/8):linear(4.25/10):zoom(1):sleep(4.25/8):linear(4.25/10):zoom(0):sleep((11.5+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+320)
		:y(60)
		:zoom(0):sleep(4.5/8):linear(4.25/10):zoom(1):sleep(4.5/8):linear(4.25/10):zoom(0):sleep((11.25+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+480)
		:y(60)
		:zoom(0):sleep(4.75/8):linear(4.25/10):zoom(1):sleep(4.75/8):linear(4.25/10):zoom(0):sleep((11+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+480)
		:y(60*3)
		:zoom(0):sleep(5/8):linear(4.25/10):zoom(1):sleep(5/8):linear(4.25/10):zoom(0):sleep((10.75+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+480)
		:y(60+240)
		:zoom(0):sleep(5.25/8):linear(4.25/10):zoom(1):sleep(5.25/8):linear(4.25/10):zoom(0):sleep((10.5+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+480)
		:y(60+360)
		:zoom(0):sleep(5.5/8):linear(4.25/10):zoom(1):sleep(5.5/8):linear(4.25/10):zoom(0):sleep((10.25+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+320)
		:y(60+360)
		:zoom(0):sleep(5.75/8):linear(4.25/10):zoom(1):sleep(5.75/8):linear(4.25/10):zoom(0):sleep((10+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+160)
		:y(60+360)
		:zoom(0):sleep(6/8):linear(4.25/10):zoom(1):sleep(6/8):linear(4.25/10):zoom(0):sleep((9.75+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80)
		:y(60+360)
		:zoom(0):sleep(6.25/8):linear(4.25/10):zoom(1):sleep(6.25/8):linear(4.25/10):zoom(0):sleep((9.5+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80)
		:y(60+240)
		:zoom(0):sleep(6.5/8):linear(4.25/10):zoom(1):sleep(6.5/8):linear(4.25/10):zoom(0):sleep((9.25+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80)
		:y(60*3)
		:zoom(0):sleep(6.75/8):linear(4.25/10):zoom(1):sleep(6.75/8):linear(4.25/10):zoom(0):sleep((9+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+160)
		:y(60*3)
		:zoom(0):sleep(7/8):linear(4.25/10):zoom(1):sleep(7/8):linear(4.25/10):zoom(0):sleep((8.75+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+320)
		:y(60*3)
		:zoom(0):sleep(7.25/8):linear(4.25/10):zoom(1):sleep(7.25/8):linear(4.25/10):zoom(0):sleep((8.5+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+320)
		:y(60+240)
		:zoom(0):sleep(7.5/8):linear(4.25/10):zoom(1):sleep(7.5/8):linear(4.25/10):zoom(0):sleep((8.25+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = file, 

		OnCommand=function(self)
		self:x(80+160)
		:y(60+240)
		:zoom(0):sleep(7.75/8):linear(4.25/10):zoom(1):sleep(7.75/8):linear(4.25/10):zoom(0):sleep((8+4.25)/4.5):queuecommand("On")
		:set_tween_uses_effect_delta(true):effectclock('beat')
		end
	};
}