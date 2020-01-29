
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/27 (stretch).png")..{},

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/8 (stretch).png")..{
		OnCommand=function(self)
			 self:diffusealpha(1):sleep(1/2*2):diffusealpha(0):sleep(1/2*2)
			 self:set_tween_uses_effect_delta(true):effectclock("beat")
			 self:queuecommand("On")
		end
	}

}