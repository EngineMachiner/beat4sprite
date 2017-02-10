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
"2 4x1 Engine.png" or
"2 4x2 Mines.png" or
"2 4x1 SquareLights.png" or
"2 16x1 Pig.png" or
"2 2x1 Piranha.png"


return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.2;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.4;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.6;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.8;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.2;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.4;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},


	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.6;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.8;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.2;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.4;diffuse,color("#cdcd00");zoom, 0.8;x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add';diffusealpha, 0.25; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.1;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.3;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.5;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.7;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.9;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.1;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.3;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.5;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.7;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,1.9;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.1;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	},

	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,2.3;diffuse,color("#ffff00");x, -_screen.w-100; y, _screen.h-math.random(0,_screen.h); linear,SongBeat+math.random(0.1000,1.000); x, _screen.w+100; effectclock,'beat';blend,'BlendMode_Add'; queuecommand,"Repeat");
	}

}