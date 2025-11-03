
-- Positioning based on the tapLua algorithm to fit sprites in the screen.

local Vector = Astro.Vector             local maxComponent = Vector.maxComponent

local astro = Astro.Layout              local quantityIn = astro.quantityIn

local offset = astro.centerOffset


local builder = ...             local Texture = builder.Texture

local Sprite = builder.Sprite or {}


local t = beat4sprite.ActorFrame { OnCommand=function(self) self:Center() end }


local max = tapLua.screenSize()             max = maxComponent(max).value

local Scale = SCREEN_HEIGHT / 240           local size = 60 * Scale

local n = quantityIn( max, size )           offset = offset(n)


local function Particle(t) return beat4sprite.Sprite(t) .. Sprite end

for i = 1, n do

    local x = max           local offset = i - offset
    
    t[#t+1] = Particle {

        Texture = Texture,

        OnCommand=function(self)

            self:initParticle( builder, i )         local rate = self:tweenRate() * i * 0.5
            
            x = x + self:GetZoomedHeight() * 2          x = i % 2 == 0 and - x or x

            self:x( size * offset ):playcommand("Prepare"):sleep(rate):queuecommand("Cycle")

        end,

        PrepareCommand=function(self) self:y( x * 0.5 ) end,

        CycleCommand=function(self)

            local rate = self:tweenRate() * 4           self:linear(rate):y( - x * 0.5 )
            
            self:queuecommand("Prepare"):queuecommand("Cycle")

        end
        
    }


    local x = max

    t[#t+1] = Particle {

        Texture = Texture,

        OnCommand=function(self)

            self:initParticle( builder, i )         local rate = self:tweenRate() * i * 0.5
            
            x = x + self:GetZoomedWidth() * 2          x = i % 2 == 0 and - x or x

            self:y( size * offset ):playcommand("Prepare"):sleep(rate):queuecommand("Cycle")

        end,

        PrepareCommand=function(self) self:x( x * 0.5 ) end,

        CycleCommand=function(self)

            local rate = self:tweenRate() * 4           self:linear(rate):x( - x * 0.5 )
            
            self:queuecommand("Prepare"):queuecommand("Cycle")

        end
        
    }

end


return t