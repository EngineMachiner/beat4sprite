local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/38 (stretch).png")..{
		OnCommand=function(self)

				local relative_posy = (self:GetHeight()/2)/self:GetHeight()
				local texcoordvelocity_y = relative_posy/4
				
		self:Center()
			:zoom(7*ScaleVar)
			:texcoordvelocity(0,texcoordvelocity_y*(2*480/self:GetHeight()))
			:customtexturerect(0,0,7,7)
			:set_use_effect_clock_for_texcoords(true)
			:rainbow():effectperiod(8)
			:addimagecoords(0,self:GetHeight()/4)
			:effectclock('beat')
		end
	};

	LoadActor("../Scripts/InnerEffect/Whirl/001", "//BGAnimations/Sprites/5th/Jewel.png", "//BGAnimations/Sprites/5th/Ring.png")..{};
	LoadActor("../Scripts/InnerEffect/Whirl/001", "//BGAnimations/Sprites/5th/Jewel.png", "//BGAnimations/Sprites/5th/Ring.png")..{ OnCommand=function(self) self:hibernate(6) end };
	LoadActor("../Scripts/InnerEffect/Whirl/001", "//BGAnimations/Sprites/5th/Jewel.png", "//BGAnimations/Sprites/5th/Ring.png")..{ OnCommand=function(self) self:hibernate(6*2) end };
}