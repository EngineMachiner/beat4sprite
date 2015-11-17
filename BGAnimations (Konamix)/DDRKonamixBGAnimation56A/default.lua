return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("3.lua")..{
		OnCommand=function(self)
			self:Center():FullScreen()
		end
	},
	LoadActor("3.lua")..{
		OnCommand=function(self)self:addx(640)
			:Center():FullScreen()
		end
	},
	LoadActor("3.lua")..{
		OnCommand=function(self)addx(-640)
			:Center():FullScreen()
		end
	},
		LoadActor("../Sprites/ParticlesRight/SquareLights", "2 4x1 SquareLights.png")..{
		OnCommand=function(self) 
			self:effectclock('music')
		end

	},
}