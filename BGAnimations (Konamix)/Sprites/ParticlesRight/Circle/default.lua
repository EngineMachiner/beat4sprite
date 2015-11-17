-- create a variable to be loaded in each Actor
-- the ... syntax is an argument that has been passed
-- in from another file
-- if no argument is passed in, load "(Something).png" as a fallback
BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (300*3)/BPM 
			else if BPM < 150 then SongBeat = (300*6)/BPM
			end
		end
local file = 

... or 
"Circle.png"


return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.05;hibernate,0.2;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.1;hibernate,0.4;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.15;hibernate,0.6;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.2;hibernate,0.8;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.25;hibernate,1;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.3;hibernate,1.2;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.35;hibernate,1.4;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},


	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.4;hibernate,1.6;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.45;hibernate,1.8;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.5;hibernate,2;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.55;hibernate,2.2;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.6;hibernate,2.4;diffuse,color("#5a5a5a");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.65;hibernate,0.1;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.7;hibernate,0.3;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.75;hibernate,0.5;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.8;hibernate,0.7;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.85;hibernate,0.9;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.9;hibernate,1.1;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.95;hibernate,1.3;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.125;hibernate,1.5;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.225;hibernate,1.7;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.325;hibernate,1.9;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.425;hibernate,2.1;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(rainbow;effectoffset,0.525;hibernate,2.3;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	}

}