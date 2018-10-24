return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:diffuse(color("#FFFFFF80"))
		end
	},

		LoadActor("../Sprites/InnerEffect/Reversed/Star", "Star.png")..{
		OnCommand=function(self) 
			self:effectclock('music')
			:rainbow()
		end

	},
}