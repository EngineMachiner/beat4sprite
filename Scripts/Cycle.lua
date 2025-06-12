
local builder = ...             local Actors = builder.Actors           local Reversed = builder.Reversed

local t = beat4sprite.ActorFrame {
    
    OnCommand=function(self)

        self:init(builder):playcommand("CycleSetup"):queuecommand("FinishCycleSetup")
    
    end

}


local time = 0          local times = {}

local function cycleTimeLeft(i)

    local t = 0          local a = i + 1         local b = #times
    
    for i = a, b do if times[i] then t = t + times[i] end end

    return t

end

for i,v in ipairs(Actors) do

    local sleep = {}        if not Reversed then i = #Actors - i + 1 end
    
    t[i] = v .. {

        CycleSetupCommand=function(self)

            local timeLeft = self:GetTweenTimeLeft()                times[i] = timeLeft

            sleep[1] = time         time = time + timeLeft          self:stoptweening()

        end,

        FinishCycleSetupCommand=function(self)

            sleep[2] = cycleTimeLeft(i)         self.CycleTimes = sleep             self.Index = i

        end

    }

end

return t