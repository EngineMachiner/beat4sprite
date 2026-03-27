
local function rainbowBlink( timer, self )

    timer.Time = 0          local color = tapLua.Color.random()         return self:diffuse(color):setAlpha()

end

local function setupRainbowBlink( self, limit )
    
    limit = limit or 2          local timer = self:timer( limit, rainbowBlink )
    
    rainbowBlink( timer, self )         return timer

end


-- Update functions.

local function updateRainbow(self)

    if not self.Rainbow then return self end


    local Effect = self.Effect          local time = Effect.updateTime or 0
    
    local rate = self:GetEffectDelta() / self:periodRate()
    
    Effect.updateTime = time + rate * 15


    local hue = time % 360              local color = HSV( hue, 1, 1 )

    return self:diffuse(color):setAlpha()

end


local merge = { setupRainbowBlink = setupRainbowBlink, updateRainbow = updateRainbow }

Astro.Table.merge( beat4sprite.Actor, merge )