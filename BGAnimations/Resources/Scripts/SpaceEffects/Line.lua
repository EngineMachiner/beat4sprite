local params = ...

local t = Def.ActorFrame{

    OnCommand=function(self)
        self:zbuffer(true)
        self:SortByDrawOrder()
        self:fov(120)
    end,
    GainFocusCommand=function(self)
        BGA_G.Stop( self, true )
    end,
    LoseFocusCommand=function(self)
        BGA_G.Stop( self )
    end

}

BGA_G.DefPar( params )

local zpos = params.Dir == "Out" and { -900, 0 }
zpos = zpos or { 0, -900 }

local p = 2
params.Num = params.Num or 4

if params.Num % 2 == 0 then 
    p = 1.5
end

for i=0,4 do
    for k=0,1 do
        t[#t+1] = Def.ActorFrame{

            OnCommand=function(self)
                self:set_tween_uses_effect_delta(true)
                self:effectclock('beat')
                self:diffusealpha(0):sleep(k*2)
                self:queuecommand("Depth")
            end,

            DepthCommand=function(self)
                if params.Shade then
                    self:queuecommand("Shade")
                end
                local p = BGA_G.GetDelay(self)[2]
                self:z(zpos[1])
                self:linear(0.25*p):diffusealpha(1)
                self:linear( 3 * p ):z(zpos[2])
                self:linear(0.25*p):diffusealpha(0)
                self:queuecommand("Depth")
            end,

            Def.Sprite{
                OnCommand=function(self)

                    self:set_tween_uses_effect_delta(true)
                    self:effectclock('beat')

                    self:Load(params.File)
                    BGA_G.SetStates(self, params)

                    local w = self:GetZoomedWidth()
                    self:x( SCREEN_CENTER_X + w * ( i - p ) * 1.5 )
                    self:y( SCREEN_BOTTOM )

                    if self:GetNumStates() > 1 then 
                        self:setstate(math.random(0,self:GetNumStates()-1))
                    end

                end,
                ShadeCommand=function(self)
                    BGA_G.ZShade( self, { zpos = zpos, t = 3 } )
                end
            }

        }
    end
end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }