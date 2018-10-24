-- create a variable to be loaded in each Actor
-- the ... syntax is an argument that has been passed
-- in from another file
-- if no argument is passed in, load "2 4x3.png" as a fallback
BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (175*3)/BPM 
			else if BPM < 150 then SongBeat = (175*6)/BPM
			end
		end
local file = ... or "2 4x3"


-- These same things were happening again and again to EVERY actor
-- and the only thing different was the duration of the tween.
-- It makes sense to use a function here.  There is less code duplication
-- and less opportunity to make a typo somewhere, once.
local AnimateThisActor = function( self, start_x, start_y, tween_duration )
	self:xy( start_x, start_y )
		:zoom(1):blend(Blend.Add):rotationz(0)
		:linear( tween_duration+math.random(0.2500,0.7500) ):zoom(0):xy( _screen.cx, _screen.cy )
		:effectclock('beat'):rotationz(720)
		:queuecommand("Repeat")
end




return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( function(child) child:visible(false):finishtweening() end, {} )
	end,
	
	-- When the ActorFrame's OnCommand is called
	-- have it play "RepeatCommand" on all children.	
	OnCommand=function(self)
		self:playcommand("Repeat")
	end,
	
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, _screen.w+70, -70,  SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, _screen.cx, -70, SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, -70, -70, SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, -70, _screen.cy,  SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, -70, _screen.h+70,  SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, _screen.cx, _screen.h+70, SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self, _screen.w+70, _screen.h+70, SongBeat+math.random(0.2500,0.7500))
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self) 
			AnimateThisActor(self, _screen.w+70, _screen.cy, SongBeat+math.random(0.2500,0.7500))
		end
	}
}