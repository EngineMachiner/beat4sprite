
local Vector = Astro.Vector         local depth = beat4sprite.Config.Depth.Range

local depthOffset = tapLua.depthOffset


local builder = ...                 local Texture = builder.Texture                 local Sprite = builder.Sprite or {}

local Colors = builder.Colors       local Rotation = builder.Rotation               Rotation = Rotation == nil and true or Rotation


local FOV = builder.FOV             FOV = tapLua.scaleFOV(FOV)

local verticalFOV = tapLua.verticalFOV(FOV)         verticalFOV = tapLua.scaleFOV(verticalFOV)


builder.Quantity = builder.Quantity or 12           local n = builder:scaleQuantity()


local min, max = table.unpack(depth)        min = min / 4       max = max / 4           local length = max - min

local function percent(z) local z = z - min       return z / length end

local function random(x) return math.random( -x, x ) end


local t = beat4sprite.ActorFrame { OnCommand=function(self) self:setupDepth(FOV) end }

for i = 1, n do

	t[i+1] = beat4sprite.Sprite {

        Texture = Texture,

        OnCommand=function(self) self:initParticle( builder, i )		self:playcommand("Scatter") end,

        ScatterCommand=function(self)

            local size = self:GetZoomedSize() * 0.5         local w, h = size:unpack()

            local rotation = Rotation and math.random( 0, 360 ) or 0            self:rotationz(rotation)


            local z = math.random( min, max )

            local x = SCREEN_CENTER_X         x = depthOffset( x, z, FOV )                    x = random(x)

            local y = SCREEN_CENTER_Y         y = depthOffset( y, z, verticalFOV )            y = random(y)

            self:xyz( x, y, z )


            local percent = 1 - percent(z)

            local color = lerp_color( percent, Colors[1], Colors[2] )       self:diffuse(color)


            local rate = self:tweenRate()           self:sleep(rate):queuecommand("Scatter")

        end
		
	} .. Sprite

end	

return t