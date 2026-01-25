
-- A builder to create retro animations.

local deepMerge = tapLua.deepMerge          local Vector = Astro.Vector

local Builder = beat4sprite.Builder         local Meta = getmetatable(Builder)

local function __call( Retro, input ) return Meta.__call( Retro, input ) end

local Retro = { Load = function(input) return Builder.Retro(input):Load() end }

Retro.init = function( input )
    
    local builder = Builder.init( input )       input:addStackLevel(1)

    
    local scale = SCREEN_HEIGHT / 240

    builder = builder:merge { Scale = scale,    Filter = false }

    local States = builder.States               States.Rate = States.Rate / 4

    
    getmetatable(builder).Builder = Retro

    return builder

end

setmetatable( Retro, { __call = __call } )

Builder.Retro = Retro


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