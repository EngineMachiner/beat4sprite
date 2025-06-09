
local builder = ...             local Actors = builder.Actors           local Reversed = builder.Reversed


local function getTime(tbl) return tbl.Time or 1 end

local function getOffset(tbl) return tbl.Offset or 0 end

local function total(tbl) return getTime(tbl) + getOffset(tbl) end


local time = 0

for i,v in ipairs(Actors) do time = time + total(v) end


local offset = getOffset(builder)           local parent

local t = beat4sprite.ActorFrame {

    InitCommand=function(self) parent = self end,

    OnCommand=function(self) self:init(builder):sleep(offset):queuecommand("Cycle") end

}


local left = time        time = 0

for i,v in ipairs(Actors) do

    local on = time + getOffset(v)          local off = left
    
    if not Reversed then i = #Actors - i + 1 end


    t[i] = v .. {

        InitCommand=function(self) if Reversed then self:playcommand("Reverse") end end,

        OnCommand=function(self) self:onGameplay() end,

        CycleCommand=function(self)

            local rate = parent:tweenRate()

            local on = on * rate            self:sleep(on):queuecommand("CycleOn")
            
            local off = off * rate          self:sleep(off):queuecommand("CycleOff")
            
            self:queuecommand("Cycle")

        end

    }


    local t = total(v)           time = time + t         left = left - t

end

return t