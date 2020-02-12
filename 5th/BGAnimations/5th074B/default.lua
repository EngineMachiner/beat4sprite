
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Quad{
		OnCommand=function(self)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:Center()
			self:diffuse(Color.Black)
		end
	},

	LoadActor("../Scripts/Stairs", "/BGAnimations/Sprites/5th/Star 12x1.png", false, color("1, 0, 0, 0") )..{
		OnCommand=function(self)
			self:xy(0,160*ScaleVar/1.25)
			BGA_TCV_OrL(self, 0, -2.75, true)
			self:hurrytweening(2)
		end
	},


}