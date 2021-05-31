
local params = ...
local p = params

BGA_G.DefPar( p )

local t = Def.ActorFrame{
    GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local n = { 5, 4 }
local c = p.Even and 1 or 0

for i=1,n[1] do
    for j=1,n[2] do

        if ( i + j ) % 2 == c then

            t[#t+1] = Def.ActorFrame{
                Def.Sprite{
                    OnCommand=function(self)

                        self:diffusealpha(0)
                        self:Load(p.File)
                        BGA_G.SetStates(self, p)

                        BGA_G.PlayCmds(self, p)
                        if p.Sleep then 
                            self:sleep(p.Sleep)
                        end
                        self:diffusealpha(1)
                        self:queuecommand("Sequence")

                        self:effectclock("beat")
                        self:set_tween_uses_effect_delta(true)

                    end,
                    SequenceCommand=function(self)

                        self:stoptweening()
            
                        local w = self:GetZoomedWidth()
                        local h = self:GetZoomedHeight()
                        local dir = { 
                            i - ( n[1] + 1 ) * 0.5, 
                            j - ( n[2] + 1 ) * 0.5 
                        }
                        local r = p.Spin and 45 * ( i + j - 1 ) or 0

                        self:Center()
                        self:diffusealpha(1)
                        self:rotationz(r)
                        self:linear(4)
                        self:x( self:GetX() + SCREEN_WIDTH * dir[1] * 1.5 )
                        self:y( self:GetY() + SCREEN_HEIGHT * dir[2] * 1.5 )
                        if p.Spin then
                            self:rotationz( self:GetRotationZ() + 360 * 2 )
                        end
                        self:sleep(0)
                        self:diffusealpha(0)
                        self:sleep(8)

                        self:queuecommand("Sequence")

                    end,
                    BlendCommand=function(self)
                        self:blend(params.Blend) 
                    end
                }
            }

        end

    end
end

return Def.ActorFrame{ t }