
local function isValid( bpm, current )

    if not bpm then return true end

    local difference = math.abs( current - bpm )            return difference >= 50

end

local function queue_BPM_Commands(self) -- Trigger command on next 4th beat.

    local b = GAMESTATE:GetSongBeat()           local s = 4 * math.ceil( b / 4 )        s = s - b

    MESSAGEMAN:Broadcast("BPMChange")           self:stoptweening():sleep(s):queuecommand("Wait")

end

local function trackBPM(self)

    if not self:isOnGameplay() then return end

    local currentBPM = tapLua.currentBPM()              local BPM = self.BPM
    
    local isValid = isValid( BPM, currentBPM )          if not isValid then return end
    
    if BPM then queue_BPM_Commands(self) end            self.BPM = currentBPM

end

local Actor = beat4sprite.ActorFrame {
    
    InitCommand=function(self)
        
        self:effectclock("beat"):set_tween_uses_effect_delta(true):SetUpdateFunction(trackBPM)
    
    end,
    
    WaitCommand=function(self) MESSAGEMAN:Broadcast("BPMChange2") end

}

tapLua.PersistentActors.add(Actor)