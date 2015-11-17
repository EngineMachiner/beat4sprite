return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:zoom(11)
				:customtexturerect(0,0,11,11)
				:addx(80):effectclock('beat')
		end
	},
		LoadActor("../Sprites/ParticlesDownSpin", "Egg.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},

}
