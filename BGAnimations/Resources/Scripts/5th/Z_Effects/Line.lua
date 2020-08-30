local params = ...

local t = Def.ActorFrame{

    GainFocusCommand=function(self)
        self:zbuffer(true)
        self:SortByDrawOrder()
        self:fov(120)
    end,
    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren( 
            function(child)
                child:visible(false)
                child:stoptweening()
                child:stopeffect()
            end )
    end

}

BGA_NoParams( params )

local Z_values

if params.Dir == "Out" then 
    Z_values = { -900, 0 }
else
    Z_values = { 0, -900 }
end

for i=0,4 do
    for k=0,1 do
        t[#t+1] = Def.ActorFrame{

            GainFocusCommand=function(self)
                self:set_tween_uses_effect_delta(true):effectclock('beat')
                self:diffusealpha(0):sleep(k*2)
                self:queuecommand("Depth")
            end,

            DepthCommand=function(self)
                if params.Shade then
                    self:queuecommand("Shade")
                end
                self:z(Z_values[1]):linear(0.25):diffusealpha(1)
                self:linear(4-0.25*2)
                self:z(Z_values[2]):linear(0.25):diffusealpha(0)
                self:queuecommand("Depth")
            end,

            Def.Sprite{
                GainFocusCommand=function(self)
                    self:Load(params.File)
                    BGA_FrameSelector(self, params)
                    self:xy( SCREEN_CENTER_X+self:GetZoomedWidth()*(i-2)*1.5, SCREEN_BOTTOM )
                    if self:GetNumStates() > 1 then 
                        self:setstate(math.random(0,self:GetNumStates()-1))
                    end
                    self:set_tween_uses_effect_delta(true):effectclock('beat')
                end,
                ShadeCommand=function(self)

                    local c = { 
                        tostring(math.abs(Z_values[2])*0.001),
                        tostring(math.abs(Z_values[1])*0.001)
                    }

                    for i=1,#c do
                        if math.abs(c[i]) < 0.25 then 
                            c[i] = 0.25
                        end 
                    end

                    self:diffuse(color(c[1]..","..c[1]..","..c[1]..",1"))
                        :linear(4-0.25*2)
                        :diffuse(color(c[2]..","..c[2]..","..c[2]..",1"))

                end
            }

        }
    end
end

return Def.ActorFrame{ t }