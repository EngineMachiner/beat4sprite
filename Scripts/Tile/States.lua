
local builder = ...            local States = builder.States

local Position = States.Position            if Position == true then Position = Vector( 1, 1 ) end


local function positionState(self) -- Offset state by position.
    
    if not Position then return end


    local i, j = self.TilePos:unpack()              i, j = Position.x * i, Position.y * j
    
    local state = self:cycleState( i + j )          self:setstate(state)

end

-- Test scrollStates as priority.

local function scrollStates(self)

    -- Return the state properties based on a direction, tile position and the sprite matrix.

    local p = {}            local scroll = States.Scroll
    
    local n = self:GetNumStates()           local pos = self.TilePos - Vector( 1, 1 )

    local sheet = self:pathMatrix() or States.SheetMatrix


    local i = pos.x + sheet.x * pos.y

    for a = 1, sheet.y do

        i = i + scroll.x + sheet.x * scroll.y           p[#p+1] = { Frame = i % n }

    end

    return p

end

return positionState, scrollStates