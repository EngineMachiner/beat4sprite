--This location does have a Sprite because of no-black-screen
BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then local SongBeat = (100*3)/BPM 
			else if BPM < 150 then local SongBeat = (100*6)/BPM
			end
		end
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;effectclock,'beat')
	};
		LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,0)
			:cropright(0.5)
			:cropbottom(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
	
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,0)
			:cropleft(0.5)
			:cropbottom(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,480)
			:cropright(0.5)
			:croptop(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,480)
			:cropleft(0.5)
			:croptop(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},

		LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,0)
			:hibernate(3.5)
			:cropright(0.5)
			:cropbottom(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
	
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,0)
			:hibernate(4.5)
			:cropleft(0.5)
			:cropbottom(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,480)
			:hibernate(5.5)
			:cropright(0.5)
			:croptop(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
	LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(640,480)
			:hibernate(6.5)
			:cropleft(0.5)
			:croptop(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},	
		LoadActor("2 (stretch)")..{
		OnCommand=function(self)
		self:xy(0,0)
			:hibernate(7.5)
			:cropright(0.5)
			:cropbottom(0.5)
			:linear(SongBeat)
			:Center()
			:sleep(1)
			:linear(SongBeat)
			:diffusealpha(0)
			end
	},
}