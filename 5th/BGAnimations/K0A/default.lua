local ScaleVar = _screen.h/480
local file = GAMESTATE:GetCurrentSong():GetBackgroundPath()
return Def.ActorFrame{
    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end, 
	
	Def.ActorFrame{
		
     	LoadActor("../Scripts/KaleidoscopeA/default.lua", ScaleVar, file)..{};
		
	}
}