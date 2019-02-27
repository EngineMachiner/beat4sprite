local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,
		LoadActor("../Backgrounds/5th/Rainbow/Full1.png")..{
			OnCommand=function(self)
				self:Center():rainbow():effectperiod(8):diffusealpha(1/4):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},
		LoadActor("../Backgrounds/5th/Rainbow/Color.png")..{
			OnCommand=function(self)
				self:Center():rainbow():effectperiod(8):diffusealpha(1/4):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},
		LoadActor("../Backgrounds/5th/Rainbow/Solar.png")..{
			OnCommand=function(self)
				self:Center():rainbow():effectperiod(8):diffusealpha(1):zoom(ScaleVar):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},	
		LoadActor("../Backgrounds/5th/Rainbow/Solar2.png")..{
			OnCommand=function(self)
				self:Center():rainbow():effectperiod(8):blend("BlendMode_Add"):diffusealpha(1):zoom(ScaleVar):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},	
}
