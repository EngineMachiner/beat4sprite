local ScaleVar = _screen.h/480
local file = "/BGAnimations/Backgrounds/5th/Kaleidoscopes/3 (stretch).png"

return Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end, 
	
    LoadActor("../Scripts/KaleidoscopeA/default.lua", ScaleVar, file)..{}
    
}