
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/8 (stretch).png")..{},

	LoadActor("../Scripts/TileTool","/BGAnimations/Sprites/5th/Symbol3.png", 3, 1)..{ 
		OnCommand=function(self)
			self:x(-self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("SpinX")
		end
 	},

}