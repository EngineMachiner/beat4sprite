
-- Syncs video playback rate to the beat of the song with 120 as the BPM center.
-- Compatible with rate modification and timing stops.

-- It's a custom hook that triggers on BPM changes.

local averageBPM = 120

local function isValid( bpm, current )

    if not bpm then return true end

    local difference = math.abs( current - bpm )            return difference >= 2 -- The minimum BPM difference to trigger the command.

end

local function trackBPM(self)

    local BPM = self.BPM

    local currentBPM = tapLua.currentBPM()                  local isValid = isValid( BPM, currentBPM )
    
    if not isValid then return end                          self:stoptweening():queuecommand("BPMChange")
    
    self.BPM = currentBPM

end


local data = ...                    local hasStopped

local Texture = data.File           local Rate = data.Rate

local t = beat4sprite.ActorFrame {
    
    OnCommand=function(self)

        local update = function() self:playcommand("UpdateFunction") end

        self:onGameplay():SetUpdateFunction(update)

    end,

    UpdateFunctionCommand=function(self)

        local isStop = self:GetEffectDelta() == 0           trackBPM(self)
        
        if isStop then
            
            self:GetChild(""):rate(0)           hasStopped = true

        elseif hasStopped then
        
            self.BPM = false            hasStopped = false -- Trigger a reset.

        end

    end,

    beat4sprite.Sprite {
        
        Texture = Texture,
        
        OnCommand=function(self) self:scale_or_crop_background() end,

        BPMChangeCommand=function(self)

            local rate = Rate or self:GetParent():GetParent():GetUpdateRate()
            
            local rate2 = tapLua.currentBPM() / averageBPM            rate = rate * rate2

            self:rate(rate)

        end
    
    }

}

return Def.ActorFrame { t }