return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("Background")..{
		OnCommand=function(self)
		self:Center():FullScreen()
		:diffusealpha(1)
		end
	};	
	
	LoadActor("ZoomOut")..{
		OnCommand=function(self)
		self:diffusealpha(1)
		end
	};
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0.5)
	};

}