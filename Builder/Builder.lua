
-- It's a builder that returns actors based on different keys and values.

local isTable = Astro.Type.isTable

local astro = Astro.Table           local Vector = Astro.Vector


local Builder = {}

local create -- Create function for each builder.

local function isSingle(tbl) return #tbl == 0 end

local function wrap(input) return isSingle(input) and { input } or input end


-- Array of builders functions.

local function Load( builders )

    if not builders.Load then builders = Builder(builders) end

    local wrap = wrap(builders)        local t = beat4sprite.ActorFrame {}

    for i,v in ipairs(wrap) do t[#t+1] = v:Load() end

    return t

end

local function merge( builders, input )

    if not input then return builders end        local wrap = wrap(input)

    local merged = astro.deepMerge( builders, wrap )

    return Builder(merged)

end


local __index = { Load = Load, merge = merge }

local function __call( Builder, input )

    local wrap = wrap(input)        astro.Meta.setIndex( wrap, __index )

    for i,v in ipairs(wrap) do
        
        v.Scale = v.Scale or input.Scale                wrap[i] = create(v)
    
    end

    return isSingle(input) and wrap[1] or wrap

end


setmetatable( Builder, { __call = __call } )


local function defaults()
    
    return {

        Scale = SCREEN_HEIGHT / 720, -- The graphics scale, 720p being the default.

        Zoom = 1,   Rate = 1,           Colors = {},
        
        States = { First = 1, Last = 1, Rate = 1, Types = {} },
        
        Effect = { Magnitude = Vector(), Offset = 0, Period = 1 },

        Layers = {},        Script = "Tile/Tile"

    }

end

-- TODO: Remove Retro, Background, SongBackground access.

create = function(input)

    local Builder = beat4sprite.Builder

    local meta = { __index = Builder, input = input }


    local builder = tapLua.deepMerge( defaults(), input )

    setmetatable( builder, meta )


    builder.Commands = Builder.Commands( input )

    return builder:setup()

end


-- Set a default background using the back layer using the texture.

local function morphBackground(self)

    local script = self.Script

    if not script:match("Morph/") or script:match("Morph/Split") then return end


    local layers = self.Layers          if layers.Back then return end

    local Texture = self.Texture        layers.Back = Builder.Background(Texture):Load()

end

function Builder:Load()

    if not self.Load then return Load(self) end -- If Builder.Load(builders) happens.

    morphBackground(self)


    local builder = self            local layers = builder.Layers

    local main = loadfile( builder.Script )(builder)

    return beat4sprite.BaseFrame {

        InitCommand=function(self)

            local update = function() self:playcommand("UpdateFunction") end

            self:SetUpdateFunction(update)

        end,

        layers.Back,       main,       layers.Front

    }

end


function Builder:merge(input)

    if not input then return self end

    local copy = DeepCopy( self:input() )           return astro.deepMerge( copy, input )

end


function Builder:input() return getmetatable(self).input end

function Builder:zoom() return self.Zoom * self.Scale end

function Builder:hasAnimationType(name)

    local types = self.States.Types         return astro.contains( types, name )

end


beat4sprite.Builder = Builder


local directory = beat4sprite.Path .. "Builder/"

tapLua.FILEMAN.LoadDirectory( directory, "Builder" )


-- Should I add Retro.Load?

local function Retro(input)

    local scale = SCREEN_HEIGHT / 240           input.Scale = scale
    
    return Builder(input)

end


-- Actors created through the builder.

local function Background( Texture )

    return beat4sprite.Builder { Texture = Texture,          Mirror = true,         ScreenScale = true }

end

local function SongBackground( Texture )
    
    local Texture = beat4sprite.songBackgroundPath()            return background(Texture)

end


local t = { Retro = Retro,          Background = Background,    SongBackground = SongBackground }

astro.merge( Builder, t )