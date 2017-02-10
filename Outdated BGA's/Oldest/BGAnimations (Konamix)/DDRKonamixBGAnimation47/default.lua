return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("default - copia.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	},

		LoadActor("../Sprites/ParticlesDown", "2 4x3 Girl.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},
}