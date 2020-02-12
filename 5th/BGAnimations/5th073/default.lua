
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/2 (stretch).png")..{
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6)
	},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/hearts 2x1", 3, 3)..{
		OnCommand=function(self)
			self:xy(0,self:GetChild("template"):GetHeight()*ScaleVar/1.25)
			BGA_TCV_OrL(self, -1, -1, true)
			self:hurrytweening(2)
		end
	}

}