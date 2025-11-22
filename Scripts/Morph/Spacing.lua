
local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers


local builder = ...             local Texture = builder.Texture

local Effect = builder.Effect           local Layers = Effect.Layers or defaultLayers * 0.5

local moveBy = Effect.moveBy or Vector(1.5)             moveBy = moveBy * SCREEN_HEIGHT / 720


local Fade = 0.03           local Step = 0.75 / Layers

local crop = beat4sprite.Load("Morph/Crop")("Sliced")       crop = crop( Step, Fade )


local t = beat4sprite.ActorFrame { OnCommand=function(self) self:Center() end }

for i = 1, Layers do

	t[i] = beat4sprite.Sprite {

        Texture = Texture,

		OnCommand=function(self)

            self.Index = i

            self:init(builder):scaleToScreen()           self:fadeHorizontally(Fade):fadeVertically(Fade)


            local i = i / Layers            local crop = crop(i)

            self:croptop( crop[1] ):cropbottom( crop[2] )


            self:queuecommand("Cycle")

		end,

		CycleCommand=function(self)

			local time = self:periodRate() * 0.5

            local moveBy = i % 2 == 0 and - moveBy or moveBy

			self:linear(time):setPos( moveBy ):smooth(time):setPos( - moveBy )

			self:queuecommand("Cycle")

		end

	}
	
end

return t