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
	
	LoadActor("Sprite")..{
		OnCommand=cmd(x,0;linear,SongBeat;addx,640;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(x,-640;linear,SongBeat;addx,640;effectclock,'beat';queuecommand,"On")
	};	
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,64;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,192;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,320;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,448;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,64;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,192;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,320;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,448;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,576;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,704;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,832;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
	LoadActor("3 2x1")..{
		OnCommand=cmd(x,960;y,576;effectclock,'beat';blend,'BlendMode_Add')
	};
}