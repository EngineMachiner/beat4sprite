return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("2 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:zoom(7)
			:customtexturerect(0,0,7,7)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},
		LoadActor("../Sprites/ParticlesRight", "2 4x1 Engine.png")..{
		OnCommand=function(self) 
			self:effectclock('music')
		end

	},

}