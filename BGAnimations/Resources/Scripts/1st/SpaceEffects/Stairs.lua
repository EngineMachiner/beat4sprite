local params = ...
local ScaleVar = _screen.h/480

if not params.fov then 
    params.fov = 160
end

local Z_values

if params.Dir == "Out" then 
    Z_values = { -750, 250 }
else
    Z_values = { 250, -750 }
end

if params.Flat then 
    for i=1,2 do
        if Z_values[i] == 250 then 
            Z_values[i] = 750
        end
    end
end

BGA_G.DefPar( params )

local t = Def.ActorFrame{

    OnCommand=function(self)
        self:fov(params.fov)
        self:zbuffer(true)
    end,
    GainFocusCommand=function(self)
        BGA_G.Stop( self, true )
    end,
    LoseFocusCommand=function(self)
        BGA_G.Stop( self )
    end

}

if not params.Add then 
    params.Add = 0
end

for i=0,4 + params.Add do

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
            self:z(Z_values[1]):linear(4*2):z(Z_values[2]):queuecommand("Next")
        end

    } 

    local k = t[#t]
    local s = math.random(0,2)
    local a = -1
    local b = math.random(0,1)
    for o=-s,math.random(0,2) do

        k[#k+1] = Def.ActorFrame{ 

            NextCommand=function(self)
                if params.Spin then 
                    self:spin()
                end
                BGA_G.PlayCmds(self, params)
            end,

            Def.Sprite{

                OnCommand=function(self)

                    if params.Flat then 
                        self:rotationx(90)
                    end

                    self:stoptweening()
                    self:Load(params.File)
                    self:set_tween_uses_effect_delta(true):effectclock('beat')

                    BGA_G.SetStates(self, params)

                    self:GetParent():x( SCREEN_CENTER_X+self:GetZoomedWidth()*0.75*ScaleVar*o )
                    self:GetParent():y( SCREEN_CENTER_Y+self:GetZoomedHeight()*0.75*ScaleVar*o )
                    self:GetParent():z( - (o+5) * 50 )

                end,
                TwoSpritesCommand=function(self)

                    self:animate(false)
                    self:setstate(i % self:GetNumStates())
                
                end,
                FramePerSpriteCommand=function(self)

                    self:animate(false)
                    if params.ZoomX then
                        self:zoomx(params.ZoomX)
                    end

                    if self:GetNumStates() > 5 then

                        if b == 0 then 
                            self:setstate(o+s)
                        else
                            self:setstate(o+s+1)
                        end

                    else

                        a = a + 1

                        while a > self:GetNumStates() - 1 do
                            a = 0
                        end

                        self:setstate(a)

                    end
                    

                end,
                ShadeCommand=function(self)

                    local c = { 
                        tostring(math.abs(Z_values[2])*0.001),
                        tostring(math.abs(Z_values[1])*0.001)
                    }

                    self:stoptweening()
                    self:diffuse(color(c[1]..","..c[1]..","..c[1]..",1"))
                    self:linear(2*2)
                    self:diffuse(color(c[2]..","..c[2]..","..c[2]..",1"))

                end

            }

        }

    end

end

return Def.ActorFrame{ t }