return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("BGEffect.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	},
	
		LoadActor("../Sprites/ParticlesDownSpin/BlendModeAdd", "Star.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},

}