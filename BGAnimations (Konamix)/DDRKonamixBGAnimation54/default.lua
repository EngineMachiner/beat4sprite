BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (240*3)/BPM and local SongBeat2 = (100*3)/BPM
			else if BPM < 150 then SongBeat = (240*6)/BPM and local SongBeat2 = (100*6)/BPM
			end
		end
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("3.lua")..{
		OnCommand=function(self)
		self:y(0):linear(SongBeat):y(-256):queuecommand("On")
	end
},
	LoadActor("3.lua")..{
		OnCommand=function(self)
		self:y(256):linear(SongBeat):y(0):queuecommand("On")
	end
},
	LoadActor("default - copia.lua")..{
		OnCommand=function(self)
		self:y(0):linear(SongBeat2):y(128):queuecommand("On")
	end
},
	LoadActor("default - copia.lua")..{
		OnCommand=function(self)
		self:y(-128):linear(SongBeat2):y(0):queuecommand("On")
	end
	},

}

