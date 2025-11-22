
-- Should the matrix be filled according to the screen?

local Vector = Astro.Vector                     local maxComponent = Vector.maxComponent

local planeAxes = Vector.planeAxes


local builder = ...                             local Texture = builder.Texture

local Sprite = builder.Sprite or {}


local max = tapLua.screenSize()                 max = maxComponent(max).value

local Scale = SCREEN_HEIGHT / 240               local size = Vector( 64, 60 ) * Scale -- 5x4 matrix in 320x240.


local n = 0

local t = beat4sprite.ActorFrame { OnCommand=function(self) self:Center() end }

for j = 1, 4 do for i = 1, 5 do

    n = n + 1        local n = n

    t[n] = beat4sprite.Sprite {

        Texture = Texture,

        OnCommand=function(self)

            self.TilePos = Vector( i, j )                       self:initParticle( builder, n )

            local size = self:GetZoomedSize() * 2               local pos = Vector( max, max ) + size

            local direction = Vector( i - 3, j - 2.5 )          pos = Vector.componentProduct( pos, direction )

            self.Pos = pos

        end,

        PrepareCommand=function(self) self:finishtweening():xy( 0, 0 ) end,

        MotionCommand=function(self)

            local rate = self:tweenRate() * 4           local pos = self.Pos

            self:linear(rate):setPos(pos)

        end

    } .. Sprite

end end

return t