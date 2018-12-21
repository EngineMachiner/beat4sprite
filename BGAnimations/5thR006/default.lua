local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,

Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end,
	},
		LoadActor("../Backgrounds/Rainbow/Full1.png")..{
			OnCommand=function(self)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/4):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},	
		LoadActor("../Backgrounds/Rainbow/Color.png")..{
			OnCommand=function(self)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/4):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},
		LoadActor("../Backgrounds/Rainbow/5A.png")..{
			OnCommand=function(self)
			self:Center():zoom(ScaleVar):blend("BlendMode_Normal"):rainbow():effectoffset(0.5):effectperiod(8):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/Color.png")..{
			OnCommand=function(self)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/4):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
			end
		},
}
