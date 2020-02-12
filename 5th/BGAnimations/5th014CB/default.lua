
local ScaleVar = _screen.h/480

local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/26 (stretch).png",
	"/BGAnimations/Backgrounds/5th/25 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor( "../Scripts/AnimatedCTR", Backgrounds, 0.25 * 0.75 )..{
		OnCommand=cmd(y,160*0.5*ScaleVar)
	},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/2 Sun 2x1.png", 3, 3, true, 0.25 * 0.75 )..{ 

		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()/2*ScaleVar)
				:x(self:GetChild("template"):GetWidth()/2*ScaleVar)
			BGA_TCV_OrL(self, 0, -1, true)
			self:hurrytweening(2)
		end

	}
}