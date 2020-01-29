return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/3 4x1.png", 1, 1, true )..{
		OnCommand=function(self)
			self:xy(0,0)
			BGA_TCV_OrL(self, 0, 2, true)
		end
	},

	LoadActor("../Scripts/Line", "/BGAnimations/Sprites/5th/Star 12x1.png")..{},
}