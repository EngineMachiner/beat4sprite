
local Vector = Astro.Vector                 local planeAxes = Vector.planeAxes

local builder = ...                         local States = builder.States

local Position = States.Position            if Position == true then Position = Vector( 1, 1 ) end

local function positionState(self) -- Offset state by position.
    
    if not Position then return end

    local i, j = self.TilePos:unpack()              i, j = Position.x * i, Position.y * j
    
    local state = self:cycleState( i + j )          return self:setstate(state)

end

local function scrollStates(self)

    -- Return the state properties based on a direction, tile position and the sprite matrix.

    local Scroll = States.Scroll                        if not Scroll then return end

    local Properties = self.stateProperties             local matrix = self:pathMatrix() or States.Matrix
    
    local pos = self.TilePos - Vector( 1, 1 )


    local p = {}        local len = Scroll.x ~= 0 and matrix.x or matrix.y

    for step = 0, len - 1 do

        local scroll = Vector()

        for i,v in ipairs(planeAxes) do
            
            local x = pos[v] - Scroll[v] * step             scroll[v] = x % matrix[v]
        
        end


        local i = scroll.x + scroll.y * matrix.x + 1        p[#p+1] = Properties[i]

    end

    return p

end

return positionState, scrollStates