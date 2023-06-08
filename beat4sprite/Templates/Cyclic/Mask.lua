
-- Mostly the animation rate and cycling time should be the same. ( 1st005B )

local params = ...      local p = params		local set = p.Set

--[[

local maskStates = p.Mask.States
if not beat4sprite.GAMESTATE.isOnGameplay() then maskStates.Rate = maskStates.Rate * 1 end

]]

p.Mask.Commands = p.Mask.Commands or {}

local time = p.CycleTime or 4					beat4sprite.Commands.add( p.Mask, "MaskSource" )

local sub = {
	beat4sprite.Sprite.bgTemplate( set[1] ), 		{},			p.Mask,		
	{ Run = function(self) self:MaskDest() end }
}

for i=1,2 do 
	i = i * 2		local sub = sub[i]	
	sub.Set = {}	sub.Script = "Cyclic/Actor"		sub.Cycle = { Time = time }
end

for k,v in ipairs(set) do
	local t = sub[4].Set		if k % 2 == 0 then t = sub[2].Set end			t[#t+1] = v
end

sub[2].Cycle.Offset = time * 0.5

return beat4sprite.Load(sub)