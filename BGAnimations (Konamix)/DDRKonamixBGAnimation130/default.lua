return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("ZoomOut")..{
		OnCommand=function(self)
		self:diffusealpha(1)
		end
	};

		LoadActor("../Sprites/InnerEffect/SpinSprite/Duck", "Duck")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},

}