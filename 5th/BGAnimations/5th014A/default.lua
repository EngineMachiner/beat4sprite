
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/23 (stretch).png",
	"/BGAnimations/Backgrounds/5th/24 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{
		OnCommand=function(self)
			self:y(160*0.5)
		end
	}

}