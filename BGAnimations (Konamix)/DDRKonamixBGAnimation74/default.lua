return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("3.png")..{
		OnCommand=function(self)
			self:Center():FullScreen() 
		end
	},
	
	LoadActor("../Sprites/InnerEffect/BlendModeAdd/Flower", "2 4x3 Flower.png")..{
		OnCommand=function(self)
			self:rainbow()
		end
	}
}