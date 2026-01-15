
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...                     local Texture = builder.Texture         local Effect = builder.Effect

local Skip = builder.Skip               local Bob = builder.Bob                 local Sprite = builder.Sprite or {}

local Type = builder.Type or 1          local Layers = Effect.Layers or defaultLayers


local types = {
    
    { Magnitude = Vector(1) },          { Magnitude = Vector { y = 1 } }

}

local Magnitude = types[Type].Magnitude

local cropVector = Vector( Magnitude.y, Magnitude.x )


if tapLua.shadersEnabled() then

    local Effect = builder.Effect           builder.Frag = "Shaders/flag.frag"

    Effect.Magnitude = Effect.Magnitude + Magnitude

    local t = beat4sprite.Load( "Morph/Shaders/Load" )( builder ) .. Sprite

    return t .. {
        
        OnCommand=function(self)

            local shader = self:GetShader()             if Skip then self:queuecommand("Skip") end

            shader:uniform1f( "type", Type )            shader:uniform1f( "bob", Bob and 1 or 0 )

        end,

        SkipCommand=function(self)

            local time = self:tweenRate()           self:sleep(time):queuecommand("Skip")

            local skip = self:isOnGameplay() and GAMESTATE:GetSongBeat() or GetTimeSinceStart() -- bitEye support.

            self:GetShader():uniform1f( "skip", skip )

        end
    
    }

end


local crop = tapLua.Load( "Sprite/Crop", "Matrix" )

local function cos(a) a = math.rad(a)       return math.cos(a) end
local function sin(a) a = math.rad(a)       return math.sin(a) end

local matrix = cropVector * ( Layers - 1 ) + Vector(1,1)

local fade = 0.03           local fadeVector = cropVector * fade

local t = beat4sprite.ActorFrame {}         local radius = 30

for i = 1, Layers do

    local angle = i * 0.75 * 360 / Layers

    t[i] = beat4sprite.Sprite {

        Texture = Texture,

        OnCommand=function(self)

            self.Index = i                              self:init(builder):fitInScreen()

            
            local pos = cropVector * ( i - 1 ) + Vector(1,1)
            
            local crop = crop( matrix, pos, fade )            local x, y = crop.x, crop.y           

            self:fadeHorizontally( fadeVector.x ):fadeVertically( fadeVector.y )

            self:cropleft( x[1] ):cropright( x[2] ):croptop( y[1] ):cropbottom( y[2] )


            local command = Bob and "Bob" or "Skip"            self:queuecommand(command)

        end,

        BobCommand=function(self)

            local Effect = self.Effect

            Effect.Magnitude = Effect.Magnitude + Magnitude * 32 / self:aspectRatio()

            
            local i = i / Layers            i = i * 0.75

            Effect.Offset = Effect.Offset + i - 0.25            self:setEffect("bob")

        end,

        SkipCommand=function(self)

            if not Skip then return end


            local x, y = cos(angle), sin(angle)
            
            local pos = tapLua.center() + radius * Vector( x, y )
            

            local time = self:tweenRate()

            self:sleep(time):setPos(pos):queuecommand("Skip")

        end,

        UpdateFunctionCommand=function(self)

            local delta = self:GetEffectDelta() * 362.5 / self:periodRate()

            angle = angle + delta         angle = angle % 360
            
            if Skip then return end


            local x, y = cos(angle), sin(angle)
            
            local pos = tapLua.center() + radius * Vector( x, y )

            self:setPos(pos)

        end

    } .. Sprite

end

return t