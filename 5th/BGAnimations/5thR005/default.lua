local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,
		LoadActor("3 (stretch).png")..{
			OnCommand=function(self)
			self:Center()
			:rainbow():effectperiod(8):effectclock("beat")
			:zoom(8*ScaleVar)
			:customtexturerect(0,0,8,8)
			:set_use_effect_clock_for_texcoords(true)
			:diffusealpha(0):linear(1):diffusealpha(1):sleep(1):linear(1):diffusealpha(0):queuecommand("On")
			end
		},
		LoadActor("2 (stretch).png")..{
			OnCommand=function(self)
			self:Center()
			:rainbow():effectperiod(8):effectclock("beat")
			:zoom(8*ScaleVar)
			:customtexturerect(0,0,8,8)
			:set_use_effect_clock_for_texcoords(true)
			:diffusealpha(1):linear(1):diffusealpha(0):sleep(1):linear(1):diffusealpha(1):queuecommand("On")
			end
		},
		LoadActor("1 (stretch).png")..{
			OnCommand=function(self)
			self:Center():blend("BlendMode_Normal")
			:rainbow():effectoffset(0.5):effectperiod(8):effectclock("beat")
			:zoom(8*ScaleVar)
			:customtexturerect(0,0,8,8)
			end
		},
}
