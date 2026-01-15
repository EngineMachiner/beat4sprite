
-- Positioning based on the tapLua algorithm to fit sprites in the screen.

local Vector = Astro.Vector             local maxComponent = Vector.maxComponent

local astro = Astro.Layout              local quantityIn = astro.quantityIn

local offset = astro.centerOffset       local isEven = Astro.Math.isEven


local builder = ...             local Texture = builder.Texture

local Sprite = builder.Sprite or {}


local t = beat4sprite.ActorFrame { OnCommand=function(self) self:Center() end }


local max = tapLua.screenSize()             max = maxComponent(max).value

local Scale = SCREEN_HEIGHT / 240           local size = 60 * Scale

local n = quantityIn( max, size )           offset = offset(n)


local function Particle(t) return beat4sprite.Sprite(t) .. Sprite end

for i = 1, n do

    local x           local offset = i - offset
    
    t[#t+1] = Particle {

        Texture = Texture,

        OnCommand=function(self)

            self:initParticle( builder, i )         local rate = self:freeRate() * i * 0.5

            x = max + self:GetZoomedHeight() * 2          x = isEven(i) and - x or x

            self:x( size * offset ):playcommand("Prepare"):sleep(rate):queuecommand("Motion")

        end,

        PrepareCommand=function(self) self:y( x * 0.5 ) end,

        MotionCommand=function(self)

            local rate = self:freeRate() * 4           self:linear(rate):y( - x * 0.5 )
            
            self:playcommand("Motion2"):queuecommand("Prepare"):queuecommand("Motion")

        end
        
    }


    local x

    t[#t+1] = Particle {

        Texture = Texture,

        OnCommand=function(self)

            self:initParticle( builder, i )         local rate = self:freeRate() * i * 0.5
            
            x = max + self:GetZoomedWidth() * 2          x = isEven(i) and - x or x

            self:y( size * offset ):playcommand("Prepare"):sleep(rate):queuecommand("Motion")

        end,

        PrepareCommand=function(self) self:x( x * 0.5 ) end,

        MotionCommand=function(self)

            local rate = self:freeRate() * 4           self:linear(rate):x( - x * 0.5 )
            
            self:playcommand("Motion2"):queuecommand("Prepare"):queuecommand("Motion")

        end
        
    }

end


return t