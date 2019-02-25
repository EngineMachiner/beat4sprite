local ScaleVar = _screen.h/480
local file = "/BGAnimations/Backgrounds/Kaleidoscopes/2 (stretch).png"

return Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end, 
	
    LoadActor("../ParticleEffects/KaleidoscopeA/default.lua", ScaleVar, file)..{};
    
}