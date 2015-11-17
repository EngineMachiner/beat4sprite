return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("default - copia.lua")..{
		OnCommand=function(self)
			self:rainbow()
				:effectclock('beat')
		end
	},

		LoadActor("../Sprites/InnerEffect/SpinSprite/Cake", "Cake.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},
}