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
	
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:diffusealpha(0.75)
			:linear(SongBeat)
			:diffusealpha(0)
			:linear(SongBeat)
			:diffusealpha(0.75)
			:queuecommand("On")
		end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:diffusealpha(0)
			:linear(SongBeat)
			:diffusealpha(0.5)
			:linear(SongBeat)
			:diffusealpha(0)
			:queuecommand("On")
		end
	},
}