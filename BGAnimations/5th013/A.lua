return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,	
	
	LoadActor("../ParticleEffects/BumpEffect","Star.png")..{
		OnCommand=function(self) 
			self:x(0)
		end
	},	
}