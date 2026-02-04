
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...             local Texture = builder.Texture           local Effect = builder.Effect

local Layers = Effect.Layers or defaultLayers           local Fade = 0.015           local Sprite = builder.Sprite or {}

local crop = tapLua.Load( "Sprite/Crop", "Centered" )


if tapLua.shadersEnabled() then

    builder.Frag = "Shaders/pulse.frag"

    return beat4sprite.Load( "Morph/Shaders/Load" )( builder ) .. Sprite

end


local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local crop = crop( i, Layers )

	t[i] = beat4sprite.Sprite {

        Texture = Texture,

		OnCommand=function(self)

            self:init(builder):fitInScreen()        self.Index = i
            
            self:fadeHorizontally(Fade):fadeVertically(Fade)
            self:cropHorizontally(crop):cropVertically(crop)

            local Effect = self.Effect

            local scale = self:aspectRatio() / self:GetZoom()           local y = i ^ 1.5 * 0.035 / Layers

            Effect.Magnitude = Vector( 1, 1 ) + Vector { y = y / scale }

			self:setEffect("pulse")

		end

	} .. Sprite
	
end

return t