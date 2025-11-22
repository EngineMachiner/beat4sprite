
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

    if not self.Rainbow then return self end


    local Effect = self.Effect          local time = Effect.updateTime or 0
    
    local rate = self:GetEffectDelta() / self:periodRate()
    
    Effect.updateTime = time + rate * 15


    local hue = time % 360          local color = HSV( hue, 1, 1 )

    self:diffuse(color)             return self

end


local function isValid( bpm, current )

    if not bpm then return true end

    local difference = math.abs( current - bpm )            return difference >= 50

end

local function trigger(self) -- Trigger command on next 4th beat.

    local b = GAMESTATE:GetSongBeat()           local s = 4 * math.ceil( b / 4 )        s = s - b

    self:stoptweening():queuecommand("BPMChange"):sleep(s):queuecommand("BPMChange2")

end

local function trackBPM(self)

    local currentBPM = tapLua.currentBPM()              local beat4sprite = self.beat4sprite
    
    local BPM = beat4sprite.BPM                         local isValid = isValid( BPM, currentBPM )
    
    if not isValid then return self end                 if BPM then trigger(self) end
    
    beat4sprite.BPM = currentBPM                        return self

end

local merge = { setupTimers = setupTimers, updateRainbow = updateRainbow, trackBPM = trackBPM }

Astro.Table.merge( beat4sprite.Actor, merge )