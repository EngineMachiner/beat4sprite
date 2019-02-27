local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/51 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4

				local relative_posy = (self:GetHeight()/2)/self:GetHeight()
				local texcoordvelocity_y = relative_posy/4

		self:Center()
			:zoom(6*ScaleVar)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),texcoordvelocity_y*(2*480/self:GetHeight()))
			:customtexturerect(0,0,6,6)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,self:GetHeight()/4)
			:rainbow():diffusealpha(0.5):effectperiod(8)
			:effectclock('beat')
		end
	};
	LoadActor("../Backgrounds/5th/51 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4

				local relative_posy = (self:GetHeight()/2)/self:GetHeight()
				local texcoordvelocity_y = relative_posy/4

		self:Center()
			:zoom(6*ScaleVar)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),texcoordvelocity_y*(2*480/self:GetHeight()))
			:customtexturerect(0,0,6,6)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,self:GetHeight()/4)
			:rainbow():diffusealpha(0.5):effectperiod(8):blend("BlendMode_Add")
			:effectclock('beat')
		end
	};
		LoadActor("../Scripts/Line/001", "/BGAnimations/Sprites/5th/Cake.png", "/BGAnimations/Sprites/5th/Burger.png", 0, ScaleVar)..{},
}