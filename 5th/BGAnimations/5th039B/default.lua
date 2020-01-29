
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/45 (stretch).png")..{
		OnCommand=function(self)
		BGA_TCV_OrL(self, 0, 0.5)
		self:Center()
			:zoom(6*ScaleVar)
			:customtexturerect(0,0,6,6)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:effectclock('beat')
		end	
	},

	LoadActor("../Scripts/InnerEffect", "/BGAnimations/Sprites/5th/Orange 2x1.png")..{}
}