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
	
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,80;y,80;effectclock,'beat';diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,240;y,80;effectclock,'beat';diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,400;y,80;effectclock,'beat';diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,560;y,80;effectclock,'beat';diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,80;y,240;effectclock,'beat';diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,240;y,240;effectclock,'beat';diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,400;y,240;effectclock,'beat';diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,560;y,240;effectclock,'beat';diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,80;y,400;effectclock,'beat';diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,240;y,400;effectclock,'beat';diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,400;y,400;effectclock,'beat';diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");queuecommand, "On")
	};
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,560;y,400;effectclock,'beat';diffuse,color("#ffe700");linear,SongBeat;diffuse,color("#ff2700");linear,SongBeat;diffuse,color("#ffe700");queuecommand, "On")
	};
}