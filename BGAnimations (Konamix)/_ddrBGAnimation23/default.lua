local t = Def.ActorFrame{
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,7;customtexturerect,0,0,7,7;blend,"BlendMode_Add";rainbow;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3.5;effectclock,'music')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoom,7;customtexturerect,0,0,7,7;blend,"BlendMode_Add";rainbow;effectoffset,0.5;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3.5;effectclock,'music')
	};
};

return t;