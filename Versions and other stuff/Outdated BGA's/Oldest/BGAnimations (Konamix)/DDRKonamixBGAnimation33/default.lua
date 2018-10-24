return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
		self:Center():FullScreen()
		end
	},


	LoadActor("3 (stretch) 2x1.png")..{
		OnCommand=function(self)
		self:Center():FullScreen()
		end
	},


	LoadActor("../Sprites/RandomPosSprite", "Aim.png")..{
		OnCommand=function(self)
		self:effectclock('beat')
		end
	},

}