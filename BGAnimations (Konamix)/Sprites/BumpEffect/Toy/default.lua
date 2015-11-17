-- create a variable to be loaded in each Actor
-- the ... syntax is an argument that has been passed
-- in from another file
-- if no argument is passed in, load "heart.png" as a fallback
BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (200*3)/BPM 
			else if BPM < 150 then SongBeat = (200*6)/BPM
			end
		end
local file = 

... or 
"Toy1"
local file2 = "Toy2"


return Def.ActorFrame{
	OnCommand=function(self) self:playcommand("Repeat") end,
	
	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.35;xy, 100, _screen.h; zoom,0; bounce; effectmagnitude,0,-240,0; effectoffset,0.8; linear,SongBeat+math.random(0.1000,1.000);zoom,1;effectoffset,0.25; effectclock,'beat'; blend,Blend.Add; queuecommand,"Repeat");
	},
	
	LoadActor( file2 )..{
		RepeatCommand=cmd(hibernate,0.15;x,200;y,_screen.h; zoom,0; bounce; effectmagnitude,0,-200,0; effectoffset,0.3; linear,SongBeat+math.random(0.1000,1.000);zoom,1;effectoffset,0.75;  effectclock,'beat'; blend,Blend.Add; queuecommand,"Repeat");
	},
	
	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.35;x,300;y,_screen.h; zoom,0; bounce; effectmagnitude,0,-180,0; effectoffset,0.7; linear,SongBeat+math.random(0.1000,1.000);zoom,1;effectoffset,0.25; effectclock,'beat'; blend,Blend.Add; queuecommand,"Repeat");
	},
	
	LoadActor( file2 )..{
		RepeatCommand=cmd(hibernate,0.45;x,400;y,_screen.h; zoom,0; bounce; effectmagnitude,0,-200,0; effectoffset,0.2; linear,SongBeat+math.random(0.1000,1.000);zoom,1.5; effectclock,'beat';effectoffset,0.5; blend,Blend.Add; queuecommand,"Repeat");
	},
	
	LoadActor( file )..{
		RepeatCommand=cmd(hibernate,0.78;x,500;y,_screen.h; zoom,0; bounce; effectmagnitude,0,-240,0; effectoffset,0.5; linear,SongBeat+math.random(0.1000,1.000);zoom,1; effectclock,'beat'; effectoffset,0.65; blend,Blend.Add; queuecommand,"Repeat");
	},
	
	LoadActor( file2 )..{
		RepeatCommand=cmd(hibernate,1.2;x,600;y,_screen.h; zoom,0; bounce; effectmagnitude,0,-120,0; effectoffset,0.1; linear,SongBeat+math.random(0.1000,1.000);zoom,1;effectoffset,0.85; effectclock,'beat'; blend,Blend.Add; queuecommand,"Repeat");
	}
}