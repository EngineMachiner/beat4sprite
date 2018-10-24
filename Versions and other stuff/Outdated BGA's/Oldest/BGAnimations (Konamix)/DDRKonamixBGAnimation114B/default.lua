return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:zoom(3)
				:customtexturerect(0,0,3,3)
				:set_use_effect_clock_for_texcoords(true)
				:texcoordvelocity(0.075,0):effectclock('beat')
		end
	},
	
		LoadActor("../Sprites/ParticlesRight", "2 16x1 Pig.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},

}