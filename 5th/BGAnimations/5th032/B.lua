local ScaleVar = _screen.h/480
local tbl = {}
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
}

tbl.state = 0
tbl.offset = 0

for i = 1,5 do
	for o = 1,3 do
		t[#t+1] = Def.Sprite{
			OnCommand=function(self)
				if o == 2 then
					self:Load("/BGAnimations/Sprites/5th/2 5x1.png")
				else
					self:Load("/BGAnimations/Sprites/5th/3 5x1.png")
				end
				self:SetAllStateDelays(1/self:GetNumStates())
				:zoom(ScaleVar)
				:rainbow()
				:effectperiod(4)
				:x( ScaleVar * 62 * ( ( 3 * ( i - 1 ) ) + 1 ) )
				:y( ScaleVar * 58 * ( ( 3 * ( o - 1 ) ) + 1 ) )
				:effectclock("beat")
				self:setstate(tbl.state)
				self:effectoffset(tbl.offset)
				tbl.state = tbl.state + 1
				tbl.offset = tbl.offset + 0.1 + o * 0.5
				if tbl.state > self:GetNumStates() - 1 then
					tbl.state = 0
				end
			end
		};
	end
end

return t