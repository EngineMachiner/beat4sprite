
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/Stairs","/BGAnimations/Sprites/5th/1 2x2.png")..{
		OnCommand=function(self)
			self:playcommand("RainbowFall")
		end
	}
}