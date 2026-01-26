
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...         local Texture = builder.Texture           local Effect = builder.Effect

builder.Type = builder.Type or 3            local Layers = Effect.Layers or defaultLayers -- Number of layers.

local Sprite = builder.Sprite or {}         local Type = builder.Type


local types = {

    { Crop = Vector { y = 1 },      Magnitude = Vector( 1.25 ) },

    { Crop = Vector(1),      Magnitude = Vector { y = 1.25 } },

    { Crop = Vector( 1, 1 ),      Magnitude = Vector( 2, 1 ) }

}

local selected = types[Type]            local Fade = 0.03

local crop = tapLua.Load( "Sprite/Crop", "Centered" )


if tapLua.shadersEnabled() then

    local Effect = builder.Effect           builder.Frag = "Shaders/bob.frag"

    Effect.Magnitude = Effect.Magnitude + selected.Magnitude

    return beat4sprite.Load( "Morph/Shaders/Load" )( builder ) .. Sprite

end


local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local crop = crop( i, Layers )

	t[i] = beat4sprite.Sprite {

        Texture = Texture,

		OnCommand=function(self)

            self:init(builder):fitInScreen()        self.Index = i


            local cropVector = selected.Crop

            local fade = cropVector * Fade          self:fadeHorizontally( fade.x ):fadeVertically( fade.y )
            local crop = cropVector * crop          self:cropHorizontally( crop.x ):cropVertically( crop.y )
        

            local Effect = self.Effect
            
            local magnitude = selected.Magnitude * i * 1.4              magnitude = Effect.Magnitude + magnitude
            
            local scale = self:aspectRatio() * self:GetZoom()           Effect.Magnitude = magnitude / scale

            self:setEffect("bob")

		end

	} .. Sprite

end

return t