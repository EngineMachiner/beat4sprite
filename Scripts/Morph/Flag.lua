
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...             local Texture = builder.Texture           local Effect = builder.Effect

local Type = builder.Type or 1              local Layers = Effect.Layers or defaultLayers

local Skip = builder.Skip           local Bob = builder.Bob


local Fade = 0.03

local types = {
    
    { Crop = Vector { y = 1 },      Magnitude = Vector(1) },

    { Crop = Vector(1),     Magnitude = Vector { y = 1 } },

}

local selected = types[Type]                local Step = 0.75 / Layers -- Layer slice.

local crop = beat4sprite.Load("Morph/Crop")("Sliced")       crop = crop( Step, Fade )


local function cos(a) a = math.rad(a)       return math.cos(a) end
local function sin(a) a = math.rad(a)       return math.sin(a) end


local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local angle = i * Step * 360             local radius = 30

    t[i] = beat4sprite.Sprite {

        Texture = Texture,

        OnCommand=function(self)

            self:init(builder):fitInScreen()        local cropVector = selected.Crop

            local fade = cropVector * Fade          self:fadeHorizontally( fade.x ):fadeVertically( fade.y )


            local v = cropVector * i / Layers

            local x = crop( v.x )           self:cropleft( x[1] ):cropright( x[2] )
            local y = crop( v.y )           self:croptop( y[1] ):cropbottom( y[2] )

            
            local command = Bob and "Bob" or "Cycle"            self:queuecommand(command)

        end,

        BobCommand=function(self)

            local Effect = self.Effect              local magnitude = selected.Magnitude * 32

            Effect.Magnitude = Effect.Magnitude + magnitude / self:aspectRatio()

            
            local i = i / Layers            i = i * 0.75

            Effect.Offset = Effect.Offset + i - 0.25


            self:setEffect("bob")

        end,

        CycleCommand=function(self)

            local x, y = cos(angle), sin(angle)
            
            local pos = tapLua.center() + radius * Vector( x, y )
            

            local step = Skip and Step * 32 or Step         local time = self:periodRate() * step

            local tween = Skip and self.sleep or self.linear        tween( self, time )     self:setPos(pos)


            angle = angle + step * 360         angle = angle % 360          self:queuecommand("Cycle")

        end

    }

end

return t