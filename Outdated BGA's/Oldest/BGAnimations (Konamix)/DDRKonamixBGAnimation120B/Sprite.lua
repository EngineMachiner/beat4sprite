BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (720*3)/BPM 
			else if BPM < 150 then SongBeat = (720*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,60;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,60;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,60;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,60;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,60;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,180;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,180;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,180;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,180;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,180;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,300;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,300;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,300;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,300;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,300;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,60;y,420;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,220;y,420;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,380;y,420;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,540;y,420;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff"))
	};
	LoadActor("1 4x2")..{
		OnCommand=cmd(x,700;y,420;effectclock,'beat';diffusealpha,0.5;linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff");linear,SongBeat;diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ffff"))
	};
}