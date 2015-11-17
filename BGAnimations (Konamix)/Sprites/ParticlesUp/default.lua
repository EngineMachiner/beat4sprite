-- create a variable to be loaded in each Actor
-- the ... syntax is an argument that has been passed
-- in from another file
-- if no argument is passed in, load "(Something).png" as a fallback
BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (250*3)/BPM 
			else if BPM < 150 then SongBeat = (250*6)/BPM
			end
		end
local file = 

... or 
"2 5x3 Atomas.png"


return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.2;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.4;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.6;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.8;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.2;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.4;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},


	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.6;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.8;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.2;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.4;diffuse,color("#5a5a5a");zoom, 0.8;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.1;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.3;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.5;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.7;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.9;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.1;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.3;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.5;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.7;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.9;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.1;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.3;x, _screen.w-math.random(0,_screen.w); y, _screen.h+100; linear,SongBeat+math.random(0.1000,1.000); y, -_screen.h-100; effectclock,'beat'; queuecommand,"Repeat");
	}

}