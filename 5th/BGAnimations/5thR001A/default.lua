
local ScaleVar = _screen.h/480
local n = SCREEN_WIDTH/640+0.5

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("B.lua", ScaleVar)..{
		OnCommand=function(self)
    		self:zoom(n)
    		self:xy(SCREEN_WIDTH*(1/2)*(-n+1), SCREEN_HEIGHT*(1/2)*(-n+1))
		end
	};

}