
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers

local builder = ...             local Texture = builder.Texture           local Effect = builder.Effect

local Layers = Effect.Layers or defaultLayers           local Fade = 0.03           local Sprite = builder.Sprite or {}

local crop = beat4sprite.Load("Morph/Crop")("Centered")


local t = beat4sprite.ActorFrame {}

for i = 1, Layers do

    local crop = crop( i, Layers )

	t[i] = beat4sprite.Sprite {	
		
        Texture = Texture,

		OnCommand=function(self)

			self:init(builder):fitInScreen()        self.Index = i
            
            self:fadeHorizontally(Fade):fadeVertically(Fade)
            self:cropHorizontally(crop):cropVertically(crop)


            local Effect = self.Effect          local magnitude = Vector { z = i * 0.833 }

			local aspectRatio = self:GetZoomedWidth() / self:GetZoomedHeight()

            Effect.Magnitude = Effect.Magnitude + magnitude / aspectRatio
            
            Effect.Offset = Effect.Offset - 0.25            self:setEffect("wag")

		end

	}
	
end

return t