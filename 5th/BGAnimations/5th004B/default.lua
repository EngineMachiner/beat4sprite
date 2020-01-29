local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/9 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0, 2)	
			self:Center()
				:zoom(1.5*ScaleVar)
				:customtexturerect(0,0,1.5,1.5)
				:set_use_effect_clock_for_texcoords(true)
				:addimagecoords(0,self:GetHeight()/4)
				:effectclock('beat')
		end
	}
	
}