return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("2")..{
		OnCommand=cmd(addx,320;addy,-320;zoom,1.75;rotationz,45)
	};
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:diffusealpha(0.25)
		end
	},
}