return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("BGEffect.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	},
	
		LoadActor("../Sprites/InnerEffect/SpriteWhirl", "2 4x2 Mines.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},

		LoadActor("../Sprites/InnerEffect/SpriteWhirl", "2 4x2 Mines.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:hibernate(3.8)
		end

	},

		LoadActor("../Sprites/InnerEffect/SpriteWhirl", "2 4x2 Mines.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:hibernate(7.6)
		end

	},
		LoadActor("../Sprites/InnerEffect/SpriteWhirl", "2 4x2 Mines.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:hibernate(11.4)
		end

	},

}