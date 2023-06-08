
local params = ...                          local p = params

local mainAngle = p.Angle or 0

local numberOf = p.numberOf or { x = 5, y = 4 }

local amplitude = p.AmplitudeAngle

-- Maybe consider renaming to SkipBy
local cross = p.Cross or 0              local set = p.Set

local t = beat4sprite.ActorFrame() .. {
	OnCommand=function(self) self:Center():rotationz(mainAngle) end
}

local cyclicSprite = loadfile( beat4sprite.Paths.Templates .. "Cyclic/Sprite.lua" )(p) .. {
    RepeatCommand=function(self) self:queuecommand("Explode") end
}

if set.File then

    set = set:getInternals()
    local file = set.File

    local cycle = p.Cycle
    local cycleTime, cycleOffset = cycle.Time, cycle.Offset

    cyclicSprite = beat4sprite.Actor(set) .. {

        OnCommand=function(self)
            self:Center():Load(file):diffusealpha(0):init()
            self:sleep( cycleOffset * self:getTweenRate() ):queuecommand("Repeat")
        end,

        RepeatCommand=function(self)

            local time = cycleTime * self:getTweenRate()

            local p = self:GetParent():GetParent()
            p:playcommand("Explode"):sleep(time) 
            p:queuecommand("Repeat")
            
        end

    }

end

for i = 1, numberOf.x do         for j = 1, numberOf.y do

    if ( i + j ) % 2 == cross then

        t[#t+1] = beat4sprite.ActorFrame() .. { beat4sprite.ActorFrame() .. {

            cyclicSprite .. {

                OnCommand=function(self)

                    self:diffusealpha(0)        if p.Run then p.Run(self) end

                    if p.Blend then self:blend( p.Blend ) end

                end,

                ExplodeCommand=function(self)

                    self:diffusealpha(1)
                    
                    local t = self:getTweenRate()
                    local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
                    local spin = self.Spin or p.Spin
                    local angle = spin and 45 * ( i + j - 1 ) or 0

                    local direction = { 
                        x = i - ( numberOf.x + 1 ) * 0.5,     y = j - ( numberOf.y + 1 ) * 0.5 
                    }

                    local x = 1.5           local y = x

                    if amplitude or p.randomAmplitude then

                        local angle = amplitude or math.random( 0, 360 )      
                        angle = math.rad( angle )

                        x = x - math.abs( math.cos( angle ) )       y = y - math.abs( math.sin( angle ) )

                    end

                    x = x * SCREEN_WIDTH * direction.x            y = y * SCREEN_HEIGHT * direction.y

                    self:stoptweening()
                    self:xy(0, 0):diffusealpha(1):rotationz(angle)
                    self:linear( t * 4 ):xy( self:GetX() + x, self:GetY() + y )

                    if spin then self:rotationz( self:GetRotationZ() + 360 * 2 ) end

                    self:linear( 0.25 * t ):diffusealpha(0)

                end

            }

        } }

    end

end     end

return t