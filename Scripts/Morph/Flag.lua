
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...             local Texture = builder.Texture           local Effect = builder.Effect

local Type = builder.Type or 1              local Layers = Effect.Layers or defaultLayers

local Skip = builder.Skip           local Bob = builder.Bob         local Sprite = builder.Sprite or {}


local Fade = 0.03

local types = {
    
    { Crop = Vector { y = 1 },      Magnitude = Vector(1) },

    { Crop = Vector(1),     Magnitude = Vector { y = 1 } },

}

local selected = types[Type]                local Step = 0.75 / Layers -- Layer slice.

local crop = beat4sprite.Load("Morph/Crop")("Sliced")       crop = crop( Step, Fade )

if tapLua.shadersEnabled() then

    local Effect = builder.Effect           builder.Frag = "Shaders/flag.frag"

    Effect.Magnitude = Effect.Magnitude + selected.Magnitude

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


local function cos(a) a = math.rad(a)       return math.cos(a) end
local function sin(a) a = math.rad(a)       return math.sin(a) end


local radius = 30

local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local angle = i * Step * 360

    t[i] = beat4sprite.Sprite {

        Texture = Texture,

        OnCommand=function(self)

            self.Index = i

            self:init(builder):fitInScreen()        local cropVector = selected.Crop

            local fade = cropVector * Fade          self:fadeHorizontally( fade.x ):fadeVertically( fade.y )


            local v = cropVector * i / Layers

            local x = crop( v.x )           self:cropleft( x[1] ):cropright( x[2] )
            local y = crop( v.y )           self:croptop( y[1] ):cropbottom( y[2] )
            
            local command = Bob and "Bob" or "Skip"            self:queuecommand(command)

        end,

        BobCommand=function(self)

            local Effect = self.Effect              local magnitude = selected.Magnitude * 32

            Effect.Magnitude = Effect.Magnitude + magnitude / self:aspectRatio()

            
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