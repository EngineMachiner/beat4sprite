return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1.png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:diffusealpha(0.5)
		end
	},
	
	LoadActor("../Sprites/BumpEffect/Toy","Toy1")..{
		OnCommand=function(self)
			self:rainbow()
		end
	},
}