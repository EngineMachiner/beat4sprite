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
	
	LoadActor("4 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:cropbottom(0.5)
			:sleep(5)
			:linear(SongBeat)
			:xy(-320,-240)
			end
	},
	
	LoadActor("4 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:cropbottom(0.5)
			:sleep(5)
			:linear(SongBeat)
			:xy(960,-240)
			end
	},
	LoadActor("4 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:croptop(0.5)
			:sleep(5)
			:linear(SongBeat)
			:xy(-320,720)
			end
	},
	LoadActor("4 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:croptop(0.5)
			:sleep(5)
			:linear(SongBeat)
			:xy(960,720)
			end
	},		
	
	LoadActor("3 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:cropbottom(0.5)
			:sleep(4)
			:linear(SongBeat)
			:xy(-320,-240)
			end
	},
	
	LoadActor("3 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:cropbottom(0.5)
			:sleep(4)
			:linear(SongBeat)
			:xy(960,-240)
			end
	},
	LoadActor("3 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:croptop(0.5)
			:sleep(4)
			:linear(SongBeat)
			:xy(-320,720)
			end
	},
	LoadActor("3 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:croptop(0.5)
			:sleep(4)
			:linear(SongBeat)
			:xy(960,720)
			end
	},		
	
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:cropbottom(0.5)
			:sleep(3)
			:linear(SongBeat)
			:xy(-320,-240)
			end
	},
	
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:cropbottom(0.5)
			:sleep(3)
			:linear(SongBeat)
			:xy(960,-240)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropright(0.5)
			:croptop(0.5)
			:sleep(3)
			:linear(SongBeat)
			:xy(-320,720)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:Center():FullScreen()
			:cropleft(0.5)
			:croptop(0.5)
			:sleep(3)
			:linear(SongBeat)
			:xy(960,720)
			end
	},		
	
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
			:xy(960,-240)
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
			:xy(960,720)
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
				:xy(960,-240)
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
				:xy(960,720)
		end
	},
}