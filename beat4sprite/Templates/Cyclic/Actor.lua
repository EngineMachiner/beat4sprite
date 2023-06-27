local parameters = ...                              local p = parameters

local set = p.Set                               local totalTime = p.TotalTime

-- Global cycle. ( Not the sub set ones )
local cycle = p.Cycle
local cycleTime, cycleOffset = cycle.Time, cycle.Offset

local t = beat4sprite.ActorFrame() .. {
    OnCommand=function(self) if p.Run then p.Run(self) end end
}

for k,v in ipairs(set) do v.CycleTime = v.CycleTime or cycleTime end

for k,v in ipairs(set) do

    local timeOffset = cycleOffset or 0
    for a,b in ipairs(set) do 
        if k == a then break end        timeOffset = timeOffset + b.CycleTime
    end

    local timeOn = v.CycleTime
    local timeOff = totalTime - timeOn

    t[k] = beat4sprite.ActorFrame() .. { beat4sprite.Load(v) .. {

        OnCommand=function(self)
            
            if v.Run then v.Run(self) end

            timeOffset = timeOffset * self:getTweenRate()
            self:diffusealpha(0):sleep(timeOffset):queuecommand("Cycle")

        end,

        CycleCommand=function(self)
            
            local tweenRate = self:getTweenRate()
            self:diffusealpha(1):sleep( tweenRate * timeOn )
            self:diffusealpha(0):sleep( tweenRate * timeOff )
            self:queuecommand("Cycle")
            
        end

    } }

end

return t