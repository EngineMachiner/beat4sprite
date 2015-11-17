return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("Wave.lua")..{
		OnCommand=function(self)
			self:rainbow():effectclock('music')
			end
	},

	LoadActor("../Sprites/ParticlesLeft/Lights", "2 14x1 Lights.png")..{
		OnCommand=function(self)
			self:x()
			end
	},

	LoadActor("../Sprites/ParticlesLeft", "Pistol.png")..{
		OnCommand=function(self)
			self:x()
			end
	},

}