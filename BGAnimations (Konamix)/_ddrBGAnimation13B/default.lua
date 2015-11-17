BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (300*3)/BPM 
			else if BPM < 150 then SongBeat = (300*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(x,0;y,0;linear,SongBeat;x,640;queuecommand,"On")
	};
	LoadActor("1.lua")..{
		OnCommand=cmd(x,-640;y,0;linear,SongBeat;x,0;queuecommand,"On")
	};
}