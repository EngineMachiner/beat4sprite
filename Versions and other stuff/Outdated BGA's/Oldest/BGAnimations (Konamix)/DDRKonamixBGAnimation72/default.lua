return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:zoom(15)
				:customtexturerect(0,0,15,15)
				:set_use_effect_clock_for_texcoords(true)
				:texcoordvelocity(0,0.075*6.75):effectclock('beat')
				:addx(64)
		end
	},
	
		LoadActor("../Sprites/ParticlesDownSpin/BlendModeAdd", "Square.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},

}