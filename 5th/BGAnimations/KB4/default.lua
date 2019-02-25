local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		LoadActor("../ParticleEffects/KaleidoscopeB","3 (stretch).png")..{
			OnCommand=function(self)
				self:xy(-ScaleVar^11.5,-ScaleVar^11)
			end
		},
}