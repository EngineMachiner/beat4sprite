
local builder = ...             builder.Quantity = builder.Quantity or 9

local Group = builder.Group or {}           local Sprite = builder.Sprite or {}


local Path = "Particles/Depth/Actors"

local MainFrame, ActorFrame, Particle = beat4sprite.Load( Path )( builder )


local n = builder.Quantity

for i = 1, n do

    local Particle = Particle(i) .. {

        OnCommand=function(self)

            local size = self:GetZoomedSize()
            
            local Effect = self.Effect                      Effect.Offset = Effect.Offset + i * 3 / n

            local Magnitude = Effect.Magnitude              Magnitude.y = Magnitude.y - size.y * 1.5

            self:queuecommand("Bounce")

        end,

        BounceCommand=function(self)
            
            self.Effect.Period = self:periodRate() * 0.5        self:setEffect("bounce")

        end,

        BPMChangeCommand=function(self) self:queuecommand("Bounce") end

    }


    local Frame = ActorFrame(i) .. {

        Particle .. Sprite,

        PrepareCommand=function(self)
            
            local x = SCREEN_WIDTH                      x = math.random( - x, x )

            local y = SCREEN_HEIGHT * 0.25              self:xy( x, y )

        end

    }

    return Frame .. Group

end


return MainFrame