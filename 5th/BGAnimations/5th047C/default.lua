
local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/Cake.png", 
	"/BGAnimations/Sprites/5th/Burger.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) 
			child:visible(false):finishtweening() 
		end)
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/51 (stretch).png")..{
		OnCommand=function(self)
		BGA_TCV_OrL(self, 1, 1)
		self:Center()
			:zoom(6*ScaleVar)
			:customtexturerect(0,0,6,6)
			:set_use_effect_clock_for_texcoords(true)
			:rainbow():effectperiod(8)
			:effectclock('beat')
		end

	},

	LoadActor("../Scripts/Line", sprites)..{}

}