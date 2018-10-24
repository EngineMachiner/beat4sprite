BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (250*3)/BPM 
			else if BPM < 150 then SongBeat = (250*6)/BPM
			end
		end
local file = ... or
"Egg.png"
 
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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

                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
                        :diffuse(color("#5a5a5a"))
                        :zoom(0.8)
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
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
                        :x( _screen.w - math.random(0, _screen.w) )
                        :y( -self:GetHeight() )
			:blend(Blend.Add)
                        :queuecommand("Animate")
        end,
        AnimateCommand=function(self)
 
                -- tween duraiton of 2 seconds
                self:linear(SongBeat+math.random(0.1000,1.000))

                        :y( _screen.h + self:GetHeight() )
                        -- rotate one full revolution on the z-axis
                        :rotationz(360)
                        -- and, finally, reset the position so we can do this again
                        :queuecommand("ResetPosition")
        end
	},
}