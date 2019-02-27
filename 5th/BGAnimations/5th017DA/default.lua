local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/1 5x1.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("../Scripts/TileTool", tool_sprite, 1/5, ScaleVar, false )..{},
	
	LoadActor("B.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetHeight() --120

			--SCREENMAN:SystemMessage(tostring(child_h))
			self:y(0)
			:linear(SCREEN_HEIGHT/child_h) --exception: not using Tool.lua
			:y(child_h*ScaleVar)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
	LoadActor("B.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetHeight()

			self:y(-child_h*ScaleVar)
			:linear(SCREEN_HEIGHT/child_h) --exception: not using Tool.lua
			:y(0)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
}