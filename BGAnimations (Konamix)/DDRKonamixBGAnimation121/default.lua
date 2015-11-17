BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (225*3)/BPM 
			else if BPM < 150 then SongBeat = (255*6)/BPM
			end
		end
		
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:zoom(7)
			:customtexturerect(0,0,7,7)
			:y(0)
			:linear(SongBeat)
			:y(480)
			:linear(SongBeat)
			:y(0)
			:queuecommand( "On" )
		end
	},
}