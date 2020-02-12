
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

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/Star 2 12x1", 4, 2)..{
		OnCommand=function(self)
			self:xy(0,self:GetChild("template"):GetHeight()*ScaleVar/1.25)
			BGA_TCV_OrL(self, -2, 0, true)
			self:hurrytweening(1)
			self:diffuse(color("#E5097F"))
		end
	},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/Star 12x1", 4, 2)..{
		OnCommand=function(self)
			self:xy(0,self:GetChild("template"):GetHeight()*ScaleVar/1.25)
			BGA_TCV_OrL(self, -2, 0, true)
			self:hurrytweening(1)
			self:playcommand("Cross")
		end
	}

}