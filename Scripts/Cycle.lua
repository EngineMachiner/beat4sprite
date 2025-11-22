
local builder = ...             local Actors = builder.Actors           local Reversed = builder.Reversed


local time, times

local t = beat4sprite.ActorFrame {
    
    OnCommand=function(self)

        time, times = 0, {}         self:init(builder)

        self:queuecommand("CycleSetup"):queuecommand("CycleSetup1"):queuecommand("CycleSetup2")
        
        self:queuecommand("CycleOn")
    
    end

}


local function cycleTimeLeft(i)

    local t = 0          local a = i + 1         local b = #times
    
    for i = a, b do if times[i] then t = t + times[i] end end

    return t

end

for i,v in ipairs(Actors) do

    local sleep = {}        if Reversed then i = #Actors - i + 1 end
    
    t[i] = v .. {

        CycleSetup1Command=function(self)

            local timeLeft = self:GetTweenTimeLeft()                times[i] = timeLeft

            sleep[1] = time         time = time + timeLeft          self:stoptweening()

        end,

        CycleSetup2Command=function(self)

            sleep[2] = cycleTimeLeft(i)         self.CycleTimes = sleep             self.Index = i


            local isZero = sleep[1] == 0 and sleep[2] == 0

            if isZero then error("Cycle failed critically because the tween duration between actors is 0!") end

        end

    }

end

return t