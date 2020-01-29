local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/22 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0.5, 0)
			self:Center()
				:zoom(8*ScaleVar)
				:customtexturerect(0,0,8,8)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
		end
	},

	LoadActor("/BGAnimations/Backgrounds/5th/59 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, -0.5, 0)
			self:Center()
				:zoom(8*ScaleVar)
				:customtexturerect(0,0,8,8)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
		end
	}

}