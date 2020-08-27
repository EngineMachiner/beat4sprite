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

BGA_NoParams( params )

local t = Def.ActorFrame{

    GainFocusCommand=function(self)
        self:fov(params.fov)
        self:zbuffer(true)
    end,
    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren( 
            function(child)
                child:visible(false)
                child:stoptweening()
            end )
    end

}

if not params.Add then 
    params.Add = 0
end

for i=0,4 + params.Add do

    t[#t+1] = Def.ActorFrame{

        GainFocusCommand=function(self)

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
                if type(params.Commands) == "table" then
                    for i = 1,#params.Commands do
                        self:playcommand(params.Commands[i])
                    end
                elseif type(params.Commands) == "string" then
                    self:playcommand(params.Commands)
                end
            end,

            Def.Sprite{

                GainFocusCommand=function(self)

                    if params.Flat then 
                        self:rotationx(90)
                    end

                    self:Load(params.File)
                    self:set_tween_uses_effect_delta(true):effectclock('beat')

                    BGA_FrameSelector(self, params)
                    if params.Zoom then 
                        self:zoom( self:GetZoom() * params.Zoom )
                    end

                    self:GetParent():x( SCREEN_CENTER_X+self:GetZoomedWidth()*0.55*ScaleVar*o)
                    self:GetParent():y( SCREEN_CENTER_Y+self:GetZoomedHeight()*0.55*ScaleVar*o )
                    self:GetParent():z( (o+5) * - 100 * 0.5 )

                end,
                TwoSpritesCommand=function(self)

                    self:animate(false)
                    self:setstate(i % self:GetNumStates())
                
                end,
                FramePerSpriteCommand=function(self)

                    self:animate(false)

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