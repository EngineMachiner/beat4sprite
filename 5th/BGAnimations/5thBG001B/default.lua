
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	OnCommand=function(self)
		self:rainbow():effectperiod(8):effectclock("beat")
	end,

	LoadActor( "../Scripts/BGEffects/1", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{}
	
}

return t