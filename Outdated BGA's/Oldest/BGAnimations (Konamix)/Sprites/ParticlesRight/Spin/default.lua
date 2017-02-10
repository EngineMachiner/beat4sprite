BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (300*3)/BPM 
			else if BPM < 150 then SongBeat = (300*6)/BPM
			end
		end
local file = ...
 
return Def.ActorFrame{
	OnCommand=function(self) end,

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.1)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.3)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.5)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.7)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.9)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.1)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.3)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        	end
	},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.5)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        	end
	},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.7)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        	end
	},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.9)

                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        	end
	},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.2)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},

	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.4)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.6)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(0.8)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.2)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.4)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.6)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
},


	LoadActor( file )..{
        OnCommand=function(self)
                self:playcommand("ResetPosition")
        end,
        ResetPositionCommand=function(self)
 
                -- reset the rotation ammount to 0
                -- reset x to be newly randomized
                -- and reset y to be offscreen below _screen.h
                self:rotationz(0)
			:hibernate(1.8)
                        :y( _screen.h - math.random(0, _screen.h) )
                        :x( -self:GetWidth() )
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :x( _screen.w + self:GetWidth() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
	},
}