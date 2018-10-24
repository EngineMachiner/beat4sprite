local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{
		OnCommand=function(self)

			local child_w = self:GetChild(""):GetChild("template"):GetWidth()

			self:x(0)
			:linear(2.25*SCREEN_WIDTH/child_w) --uses Tool.lua
			:x(-child_w*6*ScaleVar)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
			end
	};
	LoadActor("A.lua")..{
		OnCommand=function(self)

			local child_w = self:GetChild(""):GetChild("template"):GetWidth()

			self:x(child_w*6*ScaleVar)
			:linear(2.25*SCREEN_WIDTH/child_w) --uses Tool.lua
			:x(0)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
			end	
	};
}