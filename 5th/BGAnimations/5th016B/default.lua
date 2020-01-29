
local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/18 (stretch).png",
	"/BGAnimations/Backgrounds/5th/17 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{
		OnCommand=function(self)
			self:RunCommandsOnChildren(function(child) 
				child:cropbottom(0.2):croptop(0.2)
			end)
		end
	},
	
	LoadActor("../Scripts/InnerEffect/Reversed", "/BGAnimations/Sprites/5th/Symbol2.png", false, true )..{}

}