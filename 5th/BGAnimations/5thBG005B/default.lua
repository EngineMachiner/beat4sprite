
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	OnCommand=function(self)
		self:rainbow():effectperiod(8):effectclock('beat')
	end,

	LoadActor( "../Scripts/BGEffects/4", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{}

}
