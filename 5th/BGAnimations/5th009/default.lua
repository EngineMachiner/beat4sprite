local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Sprite{ 
		Texture="/BGAnimations/Backgrounds/5th/6 (stretch).png",	
		OnCommand=function(self)
			self:Center()
			:x( self:GetX() + 80 )
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,7,7)
			:visible(true)
			BGA_TCV_OrL(self, -1, -1, true)
			self:hurrytweening(2)
		end
	},

	LoadActor("B.lua")..{
		OnCommand=function(self)
			self:xy(27+80*2,-120)
			BGA_TCV_OrL(self, -1, -1, true)
			self:hurrytweening(2)
		end
	},

	LoadActor("../Scripts/Line", "/BGAnimations/Sprites/5th/2 Sun 2x1.png")..{}

}
