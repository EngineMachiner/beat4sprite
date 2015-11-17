local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;rainbow;effectclock,'beat';effectoffset,0.5)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;rainbow;effectclock,'beat';blend,"BlendMode_Add")
	};
};

return t;