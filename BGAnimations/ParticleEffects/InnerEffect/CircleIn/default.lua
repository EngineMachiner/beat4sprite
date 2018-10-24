local particle, rotationz_allow, round_move = ...
local ScaleVar = _screen.h/480
BGA_SongLimit = math.floor(GAMESTATE:GetCurrentSong():GetLastSecond()/2.4)
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
}

for k=0,BGA_SongLimit do
	t[k+1] = LoadActor("A.lua", particle, rotationz_allow, round_move)..{ 
			GainFocusCommand=function(self)
				self:RunCommandsOnChildren(function(child)  child:diffusealpha(0):sleep(0+6*k):diffusealpha(1):set_tween_uses_effect_delta(true):effectclock('beat') end) 
			end,
	}
end

return t