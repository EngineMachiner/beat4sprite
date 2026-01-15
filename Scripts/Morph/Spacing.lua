
-- Maybe could be sliced vertically too?

local Vector = Astro.Vector             local defaultLayers = beat4sprite.Config.MorphLayers

local isEven = Astro.Math.isEven


local builder = ...             local Texture = builder.Texture

local Effect = builder.Effect           local Layers = Effect.Layers or defaultLayers * 0.5

local moveBy = Effect.moveBy or Vector(4)             moveBy = moveBy * SCREEN_HEIGHT / 720

local Sprite = builder.Sprite or {}

if tapLua.shadersEnabled() then

    builder.Frag = "Shaders/spacing.frag"

    return beat4sprite.Load( "Morph/Shaders/Load" )( builder ) .. Sprite

end


local cropVector = Vector(1)

local crop = tapLua.Load( "Sprite/Crop", "Matrix" )

local matrix = cropVector * ( Layers - 1 ) + Vector(1,1)

local fade = 0.015           local fadeVector = cropVector * fade

local t = beat4sprite.ActorFrame { OnCommand=function(self) self:Center() end }

for i = 1, Layers do

    local moveBy = isEven(i) and - moveBy or moveBy

	t[i] = beat4sprite.Sprite {

        Texture = Texture,

		OnCommand=function(self)

            self.Index = i          self:init(builder):scaleToScreen()
            
            
            self:fadeHorizontally(fade):fadeVertically(fade)

            local pos = cropVector * ( i - 1 ) + Vector(1,1)            local crop = crop( matrix, pos, fade / 16 ).x

            self:croptop( crop[1] ):cropbottom( crop[2] )


            self:queuecommand("Cycle")

		end,

		CycleCommand=function(self)

			local time = self:periodRate() * 0.5

			self:linear(time):setPos( moveBy ):smooth(time):setPos( - moveBy )

			self:queuecommand("Cycle")

		end

	} .. Sprite
	
end

return t