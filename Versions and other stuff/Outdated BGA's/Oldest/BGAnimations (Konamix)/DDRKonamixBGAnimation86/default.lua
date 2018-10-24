return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1.png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
		end
	},
	
	
		LoadActor("../Sprites/InnerEffect", "2 5x3 Atomas.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end
	},
}