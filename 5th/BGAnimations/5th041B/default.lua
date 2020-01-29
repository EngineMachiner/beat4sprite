
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/47 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0, -0.5)
			self:Center()
			:zoom(3*ScaleVar)
			:customtexturerect(0,0,3,3)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:effectclock('beat')
			:cropleft(0.25)
			:cropright(0.25)
			:cropbottom(0.25*1.5)
			:croptop(0.25*1.5)
		end
	}

}