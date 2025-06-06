
local builder = ...             builder.Quantity = builder.Quantity or 9


local Path = "Particles/Depth/Actors"

local MainFrame, ActorFrame, Particle = beat4sprite.Load( Path )( builder )


local n = builder.Quantity

for i = 1, n do

    local Particle = Particle(i) .. {

        OnCommand=function(self)

            local size = self:GetZoomedSize()
            
            local Effect = self.Effect                      Effect.Offset = Effect.Offset + i * 3 / n

            local Magnitude = Effect.Magnitude              Magnitude.y = Magnitude.y - size.y * 1.5

            Effect.Period = Effect.Period * 0.5             self:setEffect("bounce")

        end

    }


    MainFrame[i] = ActorFrame(i) .. {

        Particle,

        PrepareCommand=function(self)
            
            local x = SCREEN_WIDTH                      x = math.random( - x, x )

            local y = SCREEN_HEIGHT * 0.25              self:xy( x, y )

        end

    }

end


return MainFrame