local params = ...
local ScaleVar = _screen.h/480

if not params.fov then 
    params.fov = 120
end

local Z_values

if params.Dir == "Out" then 
    Z_values = { -1000, 250 }
else
    Z_values = { 250, -1000 }
end

if params.Flat then 
    for i=1,2 do
        if Z_values[i] == 250 then 
            Z_values[i] = 750
        end
    end
end

PSX_BGA_Globals["BGA_NoParams"]( params )

local t = Def.ActorFrame{

    OnCommand=function(self)
        self:fov(params.fov)
        self:zbuffer(true)
    end,
    GainFocusCommand=function(self)
        PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
    end,
    LoseFocusCommand=function(self)
        PSX_BGA_Globals["BGA_ChildrenStop"]( self )
    end

}

for i=0,2 do

    t[#t+1] = Def.ActorFrame{

        OnCommand=function(self)
            self:stoptweening()
            self:zbuffer(true)
            self:set_tween_uses_effect_delta(true):effectclock('beat')
            self:diffusealpha(0):sleep(i*1.5):diffusealpha(1)
            self:queuecommand("Next")
        end,
        NextCommand=function(self)
            self:x( math.random( - SCREEN_WIDTH * 0.75, SCREEN_WIDTH * 0.75 ) )
            self:y( math.random( - SCREEN_HEIGHT * 0.75, SCREEN_HEIGHT * 0.75 ) )
            self:z(Z_values[1]):linear(4):z(Z_values[2]):queuecommand("Next")
        end

    } 

    local k = t[#t]

    for o=-math.random(0,2),math.random(0,2) do

        k[#k+1] = Def.ActorFrame{ 

            OnCommand=function(self)
                if params.Spin then 
                    self:spin()
                end
                PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
            end,

            Def.Sprite{

                OnCommand=function(self)

                    if params.Flat then 
                        self:rotationx(90)
                    end

                    self:stoptweening()
                    self:Load(params.File)
                    self:set_tween_uses_effect_delta(true):effectclock('beat')

                    PSX_BGA_Globals["BGA_FrameSelector"](self, params)

                    self:GetParent():x( SCREEN_CENTER_X+self:GetZoomedWidth()*ScaleVar*o)
                    self:GetParent():y( SCREEN_CENTER_Y+self:GetZoomedHeight()*ScaleVar*o )
                    self:GetParent():z( (o+5) * - 100 )

                end,
                TwoSpritesCommand=function(self)

                    self:animate(false)
                    self:setstate(i % self:GetNumStates())
                
                end,
                ShadeCommand=function(self)

                    local c = { 
                        tostring(math.abs(Z_values[2])*0.001),
                        tostring(math.abs(Z_values[1])*0.001)
                    }

                    self:stoptweening()
                    self:diffuse(color(c[1]..","..c[1]..","..c[1]..",1"))
                    self:linear(2)
                    self:diffuse(color(c[2]..","..c[2]..","..c[2]..",1"))

                end

            }

        }

    end

end

return Def.ActorFrame{ t }