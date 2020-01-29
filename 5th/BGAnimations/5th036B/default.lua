local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/43 (stretch).png")..{
		OnCommand=cmd(Center;customtexturerect,0,0,9,9;zoom,7*ScaleVar)
	},

	LoadActor("/BGAnimations/Backgrounds/5th/44 (stretch).png")..{
		OnCommand=function(self)
		BGA_TCV_OrL(self, 0.5, 0.5)
		self:Center()
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,9,9)
			:set_use_effect_clock_for_texcoords(true)
			:effectclock('beat')
		end	
	}

}