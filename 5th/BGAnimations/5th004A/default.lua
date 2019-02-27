local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/9 (stretch).png")..{
		OnCommand=function(self)

				local relative_posy = (self:GetHeight()/2)/self:GetHeight()
				local texcoordvelocity_y = relative_posy/4
				
		self:Center()
			:zoom(1.5*ScaleVar)
			:texcoordvelocity(0,texcoordvelocity_y*(2*480/self:GetHeight()))
			:customtexturerect(0,0,1.5,1.5)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:rainbow():effectperiod(8)
			:effectclock('beat')
		end
	};
}