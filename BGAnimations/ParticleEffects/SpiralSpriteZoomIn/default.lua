local ScaleVar = _screen.h/480
local file, delay =  ...
return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,
	
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*60)
		:zoom(0):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*60)
		:zoom(0):sleep(1/64):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*60)
		:zoom(0):sleep(1/64*2):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*60)
		:zoom(0):sleep(1/64*3):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*60*3)
		:zoom(0):sleep(1/64*4):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*(60+240))
		:zoom(0):sleep(1/64*5):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+480))
		:y(ScaleVar*(60+360))
		:zoom(0):sleep(1/64*6):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*(60+360))
		:zoom(0):sleep(1/64*7):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*(60+360))
		:zoom(0):sleep(1/64*8):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*(60+360))
		:zoom(0):sleep(1/64*9):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*(60+240))
		:zoom(0):sleep(1/64*10):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*80)
		:y(ScaleVar*60*3)
		:zoom(0):sleep(1/64*11):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*60*3)
		:zoom(0):sleep(1/64*12):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*60*3)
		:zoom(0):sleep(1/64*13):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+320))
		:y(ScaleVar*(60+240))
		:zoom(0):sleep(1/64*14):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
		Def.Sprite{
		Texture = file,
		OnCommand=function(self)
		self:x(ScaleVar*(80+160))
		:y(ScaleVar*(60+240))
		:zoom(0):sleep(1/64*15):linear(1/4):zoom(ScaleVar):sleep(3+0.25):linear(1/4):zoom(0):sleep(3+0.25):queuecommand("On")
		:effectclock('beat'):set_tween_uses_effect_delta(true):SetAllStateDelays(delay)
		end
	};
}