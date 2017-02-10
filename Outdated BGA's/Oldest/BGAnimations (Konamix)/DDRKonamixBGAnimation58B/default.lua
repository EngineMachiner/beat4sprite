BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (240*3)/BPM 
			else if BPM < 150 then SongBeat = (240*6)/BPM
			end
		end
		
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:diffusealpha(1)
			:linear(SongBeat)
			:diffusealpha(0)
			:linear(SongBeat)
			:diffusealpha(1)
			:queuecommand("On")
		end
	},
	LoadActor("2")..{
		OnCommand=cmd(x,0;y,0;linear,SongBeat;x,-320;y,-240;queuecommand,"On")
	},
}