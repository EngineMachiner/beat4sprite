
local ScaleVar = _screen.h/480

local tbl = {

	"/BGAnimations/Sprites/5th/4 5x1.png",
	"/BGAnimations/Sprites/5th/3 5x1.png",
	"/BGAnimations/Sprites/5th/2 5x1.png",
	"/BGAnimations/Sprites/5th/5 5x1.png"

}

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/Stairs", tbl, true)..{ 
		OnCommand=function(self)
			self:xy(0,0)
			BGA_TCV_OrL(self, 0, -3, true)
		end
	}
}

return Def.ActorFrame{ t }