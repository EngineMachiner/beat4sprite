local params = ...
local ScaleVar = _screen.h/480

local zpos = params.Dir == "Out" and { -750, 250 }
zpos = zpos or { 250, -750 }

BGA_G.DefPar( params )

local t = Def.ActorFrame{

    OnCommand=function(self)
        local fov = params.fov or 160
        self:fov(fov)
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

if params.Rot and params.Flat then
    params.Rot[1] = 45
end

if not params.Rot and params.Flat then
    params.Rot = { 45, 0, 0 }
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
            self:z(zpos[1]):linear(4*2):z(zpos[2]):queuecommand("Next")
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

                    self:stoptweening()
                    self:Load(params.File)
                    self:set_tween_uses_effect_delta(true):effectclock('beat')

                    BGA_G.SetStates(self, params)

                    if BGA_G.IsCmd( params, "Blend" ) then
                        params.Blend = params.Blend or "BlendMode_Modulate"
                        self:blend( params.Blend )
                    end

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
                    if params.Rot then
                        self:rotationx(params.Rot[1])
                        self:rotationy(params.Rot[2])
                        self:rotationz(params.Rot[3])
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
                        tostring(math.abs(zpos[2])*0.001),
                        tostring(math.abs(zpos[1])*0.001)
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