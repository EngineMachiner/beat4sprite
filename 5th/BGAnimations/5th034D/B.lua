local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
}

local state = 0
local offset = 0

for i = 1,5 do
	for o = 1,3 do
		t[#t+1] = Def.Sprite{
			OnCommand=function(self)
				if o == 2 then
					self:Load("/BGAnimations/Sprites/5th/2 5x1.png")
				else
					self:Load("/BGAnimations/Sprites/5th/3 5x1.png")
				end
				AnimationDelay(self)
				self:zoom(ScaleVar)
				:rainbow()
				:effectperiod(4)
				:x( ScaleVar * 62 * ( ( 3 * ( i - 1 ) ) + 1 ) )
				:y( ScaleVar * 58 * ( ( 3 * ( o - 1 ) ) + 1 ) )
				:effectclock("beat")
				ToolPreview(self)
				self:setstate(state)
				self:effectoffset(offset)
				state = state + 1
				offset = offset + 0.1 + o * 0.5
				if state > self:GetNumStates() - 1 then
					state = 0
				end
			end
		};
	end
end

return t