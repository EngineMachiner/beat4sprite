
local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/Burger.png", 
	"/BGAnimations/Sprites/5th/Cake.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/42 (stretch).png", 3, 3 )..{
		OnCommand=function(self)
			self:rainbow():effectperiod(8):effectclock('beat')
		end 	
	},

	LoadActor( "../Scripts/Line", sprites)..{}

}