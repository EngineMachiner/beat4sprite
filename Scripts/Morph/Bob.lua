
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...         local Texture = builder.Texture           local Effect = builder.Effect

local Type = builder.Type or 3            local Layers = Effect.Layers or defaultLayers -- Number of layers.


local types = {

    { Crop = Vector { y = 1 },      Magnitude = Vector( 1.25 ) },

    { Crop = Vector(1),      Magnitude = Vector { y = 1.25 } },

    { Crop = Vector( 1, 1 ),      Magnitude = Vector( 2, 1 ) }

}

local selected = types[Type]            local Fade = 0.03

local crop = beat4sprite.Load("Morph/Crop")("Centered")


local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local crop = crop( i, Layers )

	t[i] = beat4sprite.Sprite {

        Texture = Texture,

		OnCommand=function(self)

            self:init(builder):fitInScreen()


            local cropVector = selected.Crop

            local fade = cropVector * Fade          self:fadeHorizontally( fade.x ):fadeVertically( fade.y )
            local crop = cropVector * crop          self:cropHorizontally( crop.x ):cropVertically( crop.y )
        

            local Effect = self.Effect          local magnitude = selected.Magnitude * i * 1.333

            Effect.Magnitude = Effect.Magnitude + magnitude / self:aspectRatio()

            Effect.Offset = Effect.Offset - 0.25        self:setEffect("bob")

		end

	}

end

return t