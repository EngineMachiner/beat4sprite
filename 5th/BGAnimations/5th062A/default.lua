
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/60 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0.25, 0)
			self:Center()
				:zoom(1*ScaleVar)
				:customtexturerect(0,0,1,1)
				:cropleft(0.25):cropright(0.25)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock('beat')
		end
	}
}