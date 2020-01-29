
local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/1.png",
	"/BGAnimations/Sprites/5th/2.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/19 (stretch).png")..{
		OnCommand=cmd(Center;zoom,7*ScaleVar;customtexturerect,0,0,7,7)
	},

	LoadActor("../Scripts/ParticlesDown", sprites)..{}

}