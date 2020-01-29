local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/7 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0, -1)
			self:Center()
				:zoom(5*ScaleVar)
				:customtexturerect(0,0,5,5)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock('beat')
				:cropbottom(0.4):cropleft(0.3)
				:croptop(0.4):cropright(0.3)
		end
	};
}