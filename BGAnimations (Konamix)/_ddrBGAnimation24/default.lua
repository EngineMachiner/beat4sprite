return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;rainbow;effectclock,'music';effectoffset,0.5)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;rainbow;effectclock,'music';blend,"BlendMode_Add")
	};
	
	LoadActor("../Sprites/RandomPosSprite/BlendModeAdd/", "star.png")..{
		OnCommand=function(self)
		self:effectclock('music')
		:diffuse(color("#ffff00"))
		end
	},
	
}