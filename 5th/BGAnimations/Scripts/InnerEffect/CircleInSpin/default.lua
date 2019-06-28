local particle, round_move = ...
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RemoveAllChildren()
	end

}

for i=0,8 do
	if i ~= 4 then
		t[tostring(#t+1+i)] = LoadActor("B.lua", particle, round_move, i)..{}
	else
		i = i + 1
		t[tostring(#t+1+i)] = LoadActor("B.lua", particle, round_move, i)..{}
	end
end

for i=0+8+1,8+8+1 do
	if i ~= 4+8+1 then
		t[tostring(#t+1+i)] = LoadActor("B.lua", particle, round_move, i)..{
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:rotationz(180)
		end,
	}
	else
		i = i + 1
		t[tostring(#t+1+i)] = LoadActor("B.lua", particle, round_move, i)..{
		OnCommand=function(self)
			self:xy(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:rotationz(180)
		end,
	}
	end
end


return t