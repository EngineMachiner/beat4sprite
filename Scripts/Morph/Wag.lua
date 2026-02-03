
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers

local builder = ...             local Texture = builder.Texture           local Effect = builder.Effect

local Layers = Effect.Layers or defaultLayers           local Fade = 0.03           local Sprite = builder.Sprite or {}

local crop = tapLua.Load( "Sprite/Crop", "Centered" )


if tapLua.shadersEnabled() and false then

    builder.Frag = "Shaders/wag.frag"

    return beat4sprite.Load( "Morph/Shaders/Load" )( builder ) .. Sprite

end


local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local crop = crop( i, Layers )

	t[i] = beat4sprite.Sprite {	
		
        Texture = Texture,

		OnCommand=function(self)

			self:init(builder):fitInScreen()        self.Index = i          local i = i ^ 1.75 * 6 / Layers
            
            self:fadeHorizontally(Fade):fadeVertically(Fade)
            self:cropHorizontally(crop):cropVertically(crop)


            local Effect = self.Effect          local scale = self:aspectRatio() / self:GetZoom()

            local magnitude = Effect.Magnitude + Vector { z = i * 0.2 }       Effect.Magnitude = magnitude / scale
            
            self:setEffect("wag")

		end

	} .. Sprite
	
end

return t