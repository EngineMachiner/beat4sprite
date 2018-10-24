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
	
	LoadActor("1")..{
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
	LoadActor("3")..{
		OnCommand=cmd(rainbow;effectoffset,0.2)
	};
	LoadActor("3")..{
		OnCommand=cmd(addy,160;rainbow;effectoffset,0.4)
	};
	LoadActor("3")..{
		OnCommand=cmd(addy,320;rainbow;effectoffset,0.6)
	};
	LoadActor("3")..{
		OnCommand=cmd(addy,480;rainbow;effectoffset,0.8)
	};
}