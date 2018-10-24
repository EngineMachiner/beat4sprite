return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(-0.075*2,0):effectclock('beat')
		end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0.075*2,0):effectclock('beat')
		end
	},
		LoadActor("../Sprites/ParticlesRight/SquareLights", "2 4x1 SquareLights.png")..{
		OnCommand=function(self) 
			self:effectclock('music')
		end

	},
}