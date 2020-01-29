local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/26 (stretch).png")..{
		OnCommand=function(self)
		self:Center()
			:zoom(6*ScaleVar)
			:customtexturerect(0,0,6,6)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:effectclock('beat')
		BGA_TCV_OrL(self, 0, 1, false)
		end
	},

	LoadActor("../Scripts/WallBumpEffect", "/BGAnimations/Sprites/5th/2 4x1 Bomb.png")..{}
	
}