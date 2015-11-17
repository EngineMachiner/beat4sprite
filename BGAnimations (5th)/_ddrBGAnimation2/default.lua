local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH*2,SCREEN_HEIGHT*2;spin;effectmagnitude,0,0,-320)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd()
	};
	LoadActor("default - original.lua")..{
		OnCommand=cmd()
	};
};

return t;