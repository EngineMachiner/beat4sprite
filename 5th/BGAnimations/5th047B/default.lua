local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/SF1.png", 
	"/BGAnimations/Sprites/5th/SF2.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/snow 2x1.png", 3, 3 )..{ 
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0, 1, true)
			self:hurrytweening(2)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/1.75)
		end 
	},

	LoadActor("../Scripts/ParticlesDown", sprites, true)..{}

}