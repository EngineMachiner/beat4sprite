local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/43 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4

				local relative_posy = (self:GetHeight()/2)/self:GetHeight()
				local texcoordvelocity_y = relative_posy/4

		self:Center()
			:zoom(7*ScaleVar)
			:texcoordvelocity(-0.5*texcoordvelocity_x*(640/self:GetWidth()),texcoordvelocity_y*(-0.5*480/self:GetHeight()))
			:customtexturerect(0,0,7,7)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,self:GetHeight()/4)
			:effectclock('beat')
		end	
	};
	LoadActor("/BGAnimations/Backgrounds/5th/44 (stretch).png")..{
		OnCommand=cmd(Center;customtexturerect,0,0,9,9;zoom,7*ScaleVar)
	};
}