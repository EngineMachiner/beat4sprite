BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (160*3)/BPM 
			else if BPM < 150 then SongBeat = (160*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:zoom(4)
		:linear(SongBeat)
		:zoom(3)
		:linear(SongBeat)
		:zoom(2)
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:zoom(3)
		:linear(SongBeat)
		:zoom(2)
		:linear(SongBeat)
		:zoom(1)
		:queuecommand("On")
		end
	};

	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:zoom(2)
		:linear(SongBeat)
		:zoom(1)
		:linear(SongBeat)
		:zoom(0)
		:queuecommand("On")
		end
	};
	
	LoadActor("Circle3")..{
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X)
		:y(SCREEN_CENTER_Y)
		:zoom(1)
		:linear(SongBeat)
		:zoom(0)
		:queuecommand("On")
		end
	};
	
}