
local function rainbowBlink( timer, self )

    local color = tapLua.Color.random()         self:diffuse(color)         timer.Time = 0

end

local function setupTimers(self)
    
    local beat4sprite = self.beat4sprite            local colors = beat4sprite.Colors

    if colors.Type == "RainbowBlink" then self:timer( 2, rainbowBlink ) end

    return self
    
end


-- Update functions.

local function updateRainbow(self)

    local beat4sprite = self.beat4sprite            local colors = beat4sprite.Colors

    if colors.Type ~= "Rainbow" then return self end


    local time = colors.updateTime or 0         local rate = self:GetEffectDelta() / self:periodRate()
    
    colors.updateTime = time + rate * 0.25


    local hue = time % 360         local color = HSV( hue, 1, 1 )
    
    self:diffuse(color)         return self

end


local merge = { setupTimers = setupTimers, updateRainbow = updateRainbow }

Astro.Table.merge( beat4sprite.Actor, merge )