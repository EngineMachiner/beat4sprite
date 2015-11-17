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
	
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,0)
			:hibernate(6)
			:cropright(0.5)
			:cropbottom(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},
	
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,0)
			:hibernate(6)
			:cropleft(0.5)
			:cropbottom(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,720)
			:hibernate(6)
			:cropright(0.5)
			:croptop(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,720)
			:hibernate(6)
			:cropleft(0.5)
			:croptop(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},	
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:hibernate(5)
				:diffusealpha(0)
				:cropright(0.5)
				:cropbottom(0.5)
				:linear(SongBeat)
				:diffusealpha(1)
				:sleep(1)
				:linear(SongBeat)
				:xy(0,0)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:hibernate(5)
				:diffusealpha(0)
				:cropleft(0.5)
				:cropbottom(0.5)
				:linear(SongBeat)
				:diffusealpha(1)
				:sleep(1)
				:linear(SongBeat)
				:xy(640,0)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:hibernate(5)
				:diffusealpha(0)
				:cropright(0.5)
				:croptop(0.5)
				:linear(SongBeat)
				:diffusealpha(1)
				:sleep(1)
				:linear(SongBeat)
				:xy(0,240*2)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:hibernate(5)
				:diffusealpha(0)
				:cropleft(0.5)
				:croptop(0.5)
				:linear(SongBeat)
				:diffusealpha(1)
				:sleep(1)
				:linear(SongBeat)
				:xy(320*2,240*2)
		end
	},
	
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,0)
			:cropright(0.5)
			:cropbottom(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},
	
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,0)
			:cropleft(0.5)
			:cropbottom(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,720)
			:cropright(0.5)
			:croptop(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},
	LoadActor("1 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,720)
			:cropleft(0.5)
			:croptop(0.5)
			:sleep(2)
			:linear(SongBeat)
			:bounceend(1)
			:Center()
			:linear(0.5)
			:diffusealpha(0)
			end
	},	
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:diffusealpha(0)
				:linear(SongBeat)
				:diffusealpha(1)
				:cropright(0.5)
				:cropbottom(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(0,0)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:diffusealpha(0)
				:linear(SongBeat)
				:diffusealpha(1)
				:cropleft(0.5)
				:cropbottom(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(640,0)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:diffusealpha(0)
				:linear(SongBeat)
				:diffusealpha(1)
				:cropright(0.5)
				:croptop(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(0,240*2)
		end
	},
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:diffusealpha(0)
				:linear(SongBeat)
				:diffusealpha(1)
				:cropleft(0.5)
				:croptop(0.5)
				:sleep(1)
				:linear(SongBeat)
				:xy(320*2,240*2)
		end
	},
}