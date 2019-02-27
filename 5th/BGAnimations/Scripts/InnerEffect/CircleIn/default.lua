local particle, rotationz_allow, round_move = ...
local ScaleVar = _screen.h/480
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
}

t[#t+1] = LoadActor("A.lua", particle, rotationz_allow, round_move)..{}

return t