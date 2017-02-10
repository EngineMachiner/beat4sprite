BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then local SongBeat = (240*3)/BPM 
			else if BPM < 150 then local SongBeat = (240*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:x(320)
			:linear(SongBeat)
			:x(960)
			:queuecommand("On")
		end
	},
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:x(-320)
			:linear(SongBeat)
			:x(320)
			:queuecommand("On")
		end
	},
	
	LoadActor("1.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:diffusealpha(0.5)
		end
	},
	
}