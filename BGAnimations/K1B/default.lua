local ScaleVar = _screen.h/480
local file = "/BGAnimations/Backgrounds/Kaleidoscopes/1 (stretch).png"

return Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end, 
		
   	LoadActor("../ParticleEffects/KaleidoscopeA/default.lua", ScaleVar, file, true)..{};
	LoadActor("../Backgrounds/Tool.lua", "../Sprites/Rhombus 3x1.png", 1/3, ScaleVar, false )..{ 

		OnCommand=cmd( x,self:GetChild("template"):GetWidth()/2*ScaleVar;queuecommand,"Stairs" )

	}

}