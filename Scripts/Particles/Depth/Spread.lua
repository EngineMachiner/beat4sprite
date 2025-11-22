
local Vector = Astro.Vector             local depth = beat4sprite.Config.Depth.Range

local depthOffset = tapLua.depthOffset


local builder = ...             local Texture = builder.Texture             local Sprite = builder.Sprite or {}

local Direction = builder.Direction or Vector("Right")          local Colors = builder.Colors


local FOV = builder.FOV             FOV = tapLua.scaleFOV(FOV)

local verticalFOV = tapLua.verticalFOV(FOV)         verticalFOV = tapLua.scaleFOV(verticalFOV)


builder.Quantity = builder.Quantity or 12           local n = builder:scaleQuantity()

builder.Rate = builder.Rate * 1.5


local min, max = table.unpack(depth)        min = min / 4       max = max / 4           local length = max - min

local function percent(z) local z = z - min       return z / length end


local function random(y) return math.random( -y, y ) end

local angle = Vector.angle( Direction )


local t = beat4sprite.ActorFrame { OnCommand=function(self) self:setupDepth(FOV):rotationz(angle) end }

for i = 1, n do

    t[i] = beat4sprite.Sprite {

        Texture = Texture,
            
        OnCommand=function(self)
            
            self:initParticle( builder, i )     self:diffusealpha(0):rotationz( - angle )
            

            local rate = self:freeRate()           local i = i - 1         i = rate * i / n
            
            self:queuecommand("Prepare"):sleep(i):diffusealpha(1):queuecommand("Motion")
        
        end,

        PrepareCommand=function(self)

            local size = self:GetZoomedSize() * 0.5             local w, h = size:unpack()
            

            local z = math.random( min, max )
            
            local x = - SCREEN_CENTER_X - w         x = depthOffset( x, z, FOV )
            
            local y = SCREEN_CENTER_X + h         y = depthOffset( y, z, verticalFOV )            y = random(y)
            
            self:xyz( x, y, z )


            local percent = 1 - percent(z)

            local color = lerp_color( percent, Colors[1], Colors[2] )       self:diffuse(color)


            self.NextPos = - x

        end,

        MotionCommand=function(self)

            local variation = math.random( 500, 1000 ) * 0.001

            local rate = self:freeRate() * variation           local x = self.NextPos

            self:linear(rate):x(x)          self:queuecommand("Prepare"):queuecommand("Motion")

        end

    } .. Sprite

end

return t