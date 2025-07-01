
local Vector = Astro.Vector             local planeAxes = Vector.planeAxes

local builder = ...             local Texture = builder.Texture             local Skip = builder.Skip

local Sprite = builder.Sprite or {}


local t = beat4sprite.ActorFrame {

    OnCommand=function(self)
   
        local function onUpdate() self:playcommand("Update") end

        self:SetUpdateFunction(onUpdate)
    
    end

}


local screenSize = tapLua.screenSize()

local function direction()

    local direction = screenSize - tapLua.center()              return Vector.unit( direction )

end

local skipOffset = {

    x = function(self) self:addx( self.Direction.x * 24 * 2 ) end,
    y = function(self) self:addy( self.Direction.y * 24 * 2 ) end

}

local function check( self, k )

    local screenDim = screenSize[k]             local pos = self:GetPos()           pos = pos[k]

    local size = self:GetZoomedSize()           size = size[k] * 0.5

    local isInBounds = pos > size and pos < screenDim - size

    if isInBounds then return end               self.Direction[k] = - self.Direction[k]

    if not Skip then return end                 local skip = skipOffset[k]          skip(self)

end

local function onBounds(self)

    for i,v in ipairs(planeAxes) do check( self, v ) end

end


local n = 0             local scale = SCREEN_HEIGHT / 720

local aspectRatio = GetScreenAspectRatio()            local maxSprites = 7 * aspectRatio

for j = 1, 3 do for i = 1, 4 do

    n = n + 1           local n = n

	t[n] = beat4sprite.Sprite {

        Texture = Texture,          Condition = n < maxSprites,

		OnCommand=function(self)

			self:initParticle( builder, n )


            local i = i - 2.5           local j = j - 2

            local size = self:GetZoomedSize()                   size = Vector( size.x * i, size.y * j )

            local pos = tapLua.center() + size * 0.5            self:setPos(pos)


            self.Time = 0           self.Direction = direction()

            local n = Skip and n * 0.666 or n - 1           self.Sleep = self:tweenRate() * n * 0.75
            
		end,

		UpdateCommand=function(self)
            
            local hasTimeLeft = self:GetTweenTimeLeft() > 0             local direction = self.Direction
            
            if not direction or hasTimeLeft then return end


            local d = self:GetEffectDelta()             d = math.min( d, 0.1 ) -- Clamping needed in case there's a big frame skip!

            self.Time = self.Time + d                   if self.Time < self.Sleep then return end


            local rate = self:tweenRate()               local x = Skip and 12 or 1 / rate
            
            direction = direction * d * x * scale * 500

            
            local pos = self:GetPos() + direction           self:setPos(pos)    onBounds(self)

            if Skip then self:sleep( rate * 0.5 ) end

        end

	} .. Sprite

end end


return t