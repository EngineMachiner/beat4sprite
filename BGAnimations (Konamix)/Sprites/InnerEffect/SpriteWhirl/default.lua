-- create a variable to be loaded in each Actor
-- the ... syntax is an argument that has been passed
-- in from another file
-- if no argument is passed in, load "flower.png" as a fallback
BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (175*3)/BPM 
			else if BPM < 150 then SongBeat = (175*6)/BPM
			end
		end
local file = ... or "2 4x2 Mines.png"


-- These same things were happening again and again to EVERY actor
-- and the only thing different was the duration of the tween.
-- It makes sense to use a function here.  There is less code duplication
-- and less opportunity to make a typo somewhere, once.
local AnimateThisActor = function( self, start_x, start_y, tween_duration)
	self:xy( _screen.cx, _screen.cy )
		:zoom(0.1):rotationz(0)
		:linear( tween_duration ):zoom(1):xy( start_x, start_y )
		:effectclock('beat'):rotationz(720)
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
			AnimateThisActor(self:hibernate(0.1), _screen.w, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.2), _screen.w-64, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.3), _screen.w-128, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.4), _screen.w-192, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.5), _screen.w-256, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.6), _screen.w-320, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.7), _screen.w-384, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.8), _screen.w-448, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(0.9), _screen.w-512, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1), _screen.w-576, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.1), _screen.w-640, -64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.1), _screen.w-704, 0,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.2), _screen.w-704, 64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.3), _screen.w-704, 128,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.4), _screen.w-704, 192,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.5), _screen.w-704, 256,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.6), _screen.w-704, 320,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.7), _screen.w-704, 384,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.8), _screen.w-704, 448,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(1.9), _screen.w-704, 512,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2), _screen.w-704, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2), _screen.w-576, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.1), _screen.w-512, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.2), _screen.w-448, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.3), _screen.w-384, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.4), _screen.w-320, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.5), _screen.w-256, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.6), _screen.w-192, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.7), _screen.w-128, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.8), _screen.w-64, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.9), _screen.w, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(2.9), _screen.w+64, 576,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3), _screen.w+64, 512,  SongBeat)
		end
	}, 
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.1), _screen.w+64, 448,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.2), _screen.w+64, 384,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.3), _screen.w+64, 320,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.4), _screen.w+64, 256,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.5), _screen.w+64, 192,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.6), _screen.w+64, 128,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.7), _screen.w+64, 64,  SongBeat)
		end
	},
	LoadActor( file )..{
		RepeatCommand=function(self)
			AnimateThisActor(self:hibernate(3.8), _screen.w+64, 0,  SongBeat)
		end
	},
}
