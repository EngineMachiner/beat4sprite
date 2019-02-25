local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/Tool.lua", "../Sprites/5 4x1.png", 2*1/(4), ScaleVar, true )..{ 

	OnCommand=cmd( x,self:GetChild("template"):GetWidth()/2*ScaleVar )

	},
	
	LoadActor("../ParticleEffects/ParticlesDown", "Globe 6x1.png")..{},

}