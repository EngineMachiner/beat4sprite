
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...             local Texture = builder.Texture           local Effect = builder.Effect

local Layers = Effect.Layers or defaultLayers           local Fade = 0.03           local Sprite = builder.Sprite or {}

local crop = beat4sprite.Load("Morph/Crop")("Centered")


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


            local y = i / Layers            y = y / self:aspectRatio()

            local magnitude = Vector( 1, 1 ) + Vector { y = y * 0.833 }

            local Effect = self.Effect          Effect.Magnitude = Effect.Magnitude + magnitude


			self:setEffect("pulse")

		end

	} .. Sprite
	
end

return t