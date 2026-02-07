
local function rainbowBlink( timer, self )

    local color = tapLua.Color.random()         self:diffuse(color):setAlpha()         timer.Time = 0

    return self

end

local function setupRainbowBlink(self) return self:timer( 2, rainbowBlink ) end


-- Update functions.

local function updateRainbow(self)

    if not self.Rainbow then return self end


    local Effect = self.Effect          local time = Effect.updateTime or 0
    
    local rate = self:GetEffectDelta() / self:periodRate()
    
    Effect.updateTime = time + rate * 15


    local hue = time % 360              local color = HSV( hue, 1, 1 )

    self:diffuse(color):setAlpha()      return self

end


local merge = { setupRainbowBlink = setupRainbowBlink, updateRainbow = updateRainbow }

Astro.Table.merge( beat4sprite.Actor, merge )