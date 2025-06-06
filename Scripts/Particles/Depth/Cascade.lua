
local Vector = Astro.Vector

local builder = ...             builder.Quantity = builder.Quantity or 8


local Path = "Particles/Depth/Actors"

local MainFrame, ActorFrame, _Particle = beat4sprite.Load( Path )( builder )


local n = builder.Quantity          local z = -48

local function Particle( i, n )

    return _Particle(i) .. {

        OnCommand=function(self)

            local offset = self:GetZoomedSize() + Vector { z = z }                  local n = n + 1
        
            local i = i - n * 0.5               local pos = offset * i              self:setPos(pos)

            self.Z = pos.z

        end

    }

end


local function pos()

    local x = SCREEN_WIDTH * 2              x = math.random( - x, x )
    local y = SCREEN_HEIGHT * 2             y = math.random( - y, y )

    return x, y

end

for i = 1, n do

    local n = math.random( 2, 5 )                local z = math.abs(z)
    
    MainFrame[i] = ActorFrame(i) .. {
        
        OnCommand=function(self) self.Depth = z * n * 0.5 end,

        PrepareCommand=function(self) local x, y = pos()         self:xy( x, y ) end
    
    }

    local t = MainFrame[i]           for i = 1, n do t[i] = Particle( i, n ) end

end

return MainFrame