
-- A builder to create retro animations.

local deepMerge = tapLua.deepMerge

local Builder = beat4sprite.Builder         local Vector = Astro.Vector

local function onCreation( builder )
    
    local scale = SCREEN_HEIGHT / 240

    builder = builder:merge { Scale = scale,    Filter = false }

    local States = builder.States           States.Rate = States.Rate / 4

    return builder

end

local function __call( Retro, input )

    input.onCreation = onCreation         return Builder(input)

end

local Retro = { Load = function(input) return Builder.Retro(input):Load() end }

setmetatable( Retro, { __call = __call } )          Builder.Retro = Retro


local function Background( input )

    local base = Builder.Background():input()

    input = deepMerge( base, input )            return Retro(input)

end

local function Background2( input )

    local base = Builder.Background2():input()

    input = deepMerge( base, input )            return Retro(input)

end

Retro.Background = Background
Retro.Background2 = Background2