return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1.png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:effectclock('beat')
		end
	},
	
		LoadActor("../Sprites/ParticlesDownSpin/BlendModeAdd", "flower1.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:diffuse(color("#FF0000")):linear(0.125):diffuse(color("#FFA000"))
		end

	},

		LoadActor("../Sprites/ParticlesDownSpin/BlendModeAdd", "flower2.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:zoom(0.75)
			:diffuse(color("#FFA000")):linear(0.125):diffuse(color("#FF0000"))
		end

	},

}