return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1.png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
		end
	},
	
	
	-- load BGAniamtion 4 using stars
	LoadActor("../Sprites/BumpEffect", "Duckie.png")..{
		OnCommand=function(self)
			self:x()
		end
	},
}