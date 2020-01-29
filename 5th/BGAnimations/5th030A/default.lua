local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/Circle.png", 
	"/BGAnimations/Sprites/5th/Circle2.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/39 (stretch).png" )..{},

	LoadActor("../Scripts/Line", sprites)..{}
	
}