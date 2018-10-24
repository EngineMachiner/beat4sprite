local particle, round_move, sleep_num = ...
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
}

	t[#t+1] = LoadActor("A.lua", particle, round_move, sleep_num)..{}


return t