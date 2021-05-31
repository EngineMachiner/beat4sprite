
local params = ...

local scl = _screen.h/480

local zpos = params.Dir == "Out" and { -1000, 500 }
zpos = zpos or { 1000, -750 }

BGA_G.DefPar( params )

local t = Def.ActorFrame{

    OnCommand=function(self)
        self:fov(160)
        self:zbuffer(true)
    end,
    GainFocusCommand=function(self)
        BGA_G.Stop( self, true )
    end,
    LoseFocusCommand=function(self)
        BGA_G.Stop( self )
    end

}

for i=0,8 do

    t[#t+1] = Def.ActorFrame{

        OnCommand=function(self)
            local d = BGA_G.GetDelay(self)[2]
            self:stoptweening()
            self:zbuffer(true)
            self:set_tween_uses_effect_delta(true)
            self:effectclock('beat')
            self:diffusealpha(0):sleep(i*1.5*d):diffusealpha(1)
            self:queuecommand("Next")
        end,
        NextCommand=function(self)
            local d = BGA_G.GetDelay(self)[2] * 16
            if params.Shade then
              self:queuecommand("Shade")
            end
            self:x( math.random( - SCREEN_WIDTH * 0.75, SCREEN_WIDTH * 0.75 ) )
            self:y( math.random( - SCREEN_HEIGHT * 0.75, SCREEN_HEIGHT * 0.75 ) )
            self:z(zpos[1]):linear(d):z(zpos[2]):queuecommand("Next")
        end

    } 

    local k = t[#t]

    for o=-math.random(0,2),math.random(0,2) do

        k[#k+1] = Def.ActorFrame{ 

            OnCommand=function(self)
                if params.Spin then 
                    self:spin()
                    self:effectmagnitude(0,0,-180)
                end
                BGA_G.PlayCmds(self, params)
            end,

            Def.Sprite{

                OnCommand=function(self)

                    self:Load(params.File)
                    self:set_tween_uses_effect_delta(true)
                    self:effectclock('beat')

                    BGA_G.SetStates(self, params)

                    local pa = self:GetParent()
                    local w = self:GetZoomedWidth()
                    local h = self:GetZoomedHeight()

                    pa:x( SCREEN_CENTER_X + w * scl * o )
                    pa:y( SCREEN_CENTER_Y + h * scl * o )
                    pa:z( - ( o + 5 ) * 100 )

                end,
                TwoSpritesCommand=function(self)
                    self:animate(false)
                    self:setstate(i % self:GetNumStates())
                end,
                ShadeCommand=function(self)
                    self:stoptweening()
                    BGA_G.ZShade( self, { zpos = zpos, t = 2 } )
                end

            }

        }

    end

end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }