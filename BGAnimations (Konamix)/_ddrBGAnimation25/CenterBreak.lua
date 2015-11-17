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
			:cropright(0.5)
			:cropbottom(0.5)
			:sleep(2)
			:linear(SongBeat)
			:xy(-320,-240)
			end
	},
	
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:cropbottom(0.5)
			:sleep(2)
			:linear(SongBeat)
			:xy(640,-240)
			end
	},
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:croptop(0.5)
			:sleep(2)
			:linear(SongBeat)
			:xy(-320,720)
			end
	},
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:croptop(0.5)
			:sleep(2)
			:linear(SongBeat)
			:xy(640,720)
			end
	},	
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:cropright(0.5)
				:cropbottom(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(-320,-240)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:cropleft(0.5)
				:cropbottom(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(640,-240)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:cropright(0.5)
				:croptop(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(-320,720)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:cropleft(0.5)
				:croptop(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(640,720)
		end
	},
}