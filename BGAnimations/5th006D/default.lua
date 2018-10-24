local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end,
	},

	LoadActor("A.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetHeight() --480
			local child_states = self:GetChild(""):GetNumStates()

			self:y(0)
			:linear(1.25*child_states*SCREEN_HEIGHT/child_h) --exception: not using Tool.lua
			:y(-child_h*ScaleVar)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
	LoadActor("A.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetHeight()
			local child_states = self:GetChild(""):GetNumStates()

			self:y(child_h*ScaleVar)
			:linear(1.25*child_states*SCREEN_HEIGHT/child_h) --exception: not using Tool.lua
			:y(0)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
}