local BPM = GAMESTATE:GetSongPosition():GetCurBPS()*60/_screen.w
local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH*2,SCREEN_HEIGHT;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075,0;effectclock,'beat')
	};
};

return t;