
-- It's a builder that returns actors based on different keys and values.

local Vector = Astro.Vector

local astro = Astro.Table               local deepCopy = astro.Copy.deep


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

    local merged = tapLua.deepMerge( builders, wrap )

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

        Zoom = 1,   Rate = 1,           Colors = {},            Alpha = 1,
        
        States = { First = 1, Last = 1, Rate = 1, Types = {} },
        
        Effect = { Magnitude = Vector(), Offset = 0, Period = 1 },

        Layers = {},        Script = "Tile/Tile"

    }

end

local metaBuilder

create = function(input)

    local meta = { __index = metaBuilder, input = input }


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

local textureScripts = {
    
    "Kaleidoscope/Tile.lua",       "Kaleidoscope/Triangle.lua",
    
    "Morph/Stretch.lua",        "Tile/Tile.lua"

}

function Builder:Load()

    if not self.Load then return Load(self) end -- If Builder.Load(builders) happens.

    morphBackground(self)


    local Builder = self                    local Layers = Builder.Layers

    local Script = Builder.Script           local Main = loadfile(Script)(Builder)


    local Alpha = Builder.Alpha

    local function isValid( k, v ) return Script:match(v) end

    local isTexture = astro.contains( textureScripts, isValid )

    Main = Def.ActorFrame {
        
        Main,
        
        OnCommand=function(self)
            
            if not isTexture then self:diffusealpha(Alpha) end 
        
        end
    
    }


    return beat4sprite.BaseFrame {

        InitCommand=function(self)

            local update = function() self:playcommand("UpdateFunction") end

            self:SetUpdateFunction(update)

        end,

        OnCommand=function(self) self:init(Builder) end,

        Layers.Back,       Main,       Layers.Front

    }

end


function Builder:merge(input)

    if not input then return self end           local copy = deepCopy( self:input() )
    
    tapLua.deepMerge( copy, input )             return Builder(copy)

end


function Builder:input() return getmetatable(self).input end

function Builder:zoom() return self.Zoom * self.Scale end

function Builder:hasAnimationType(name)

    local types = self.States.Types         return astro.contains( types, name )

end


beat4sprite.Builder = Builder


tapLua.FILEMAN.LoadDirectory( beat4sprite.Path .. "Builder/" )

metaBuilder = deepCopy(Builder)


local function Retro(input)

    local scale = SCREEN_HEIGHT / 240           input.Scale = scale

    input.Filtering = false             return Builder(input)

end


-- Builder templates for easy creation.

local function Background( Texture )

    return beat4sprite.Builder { Texture = Texture,          Mirror = true,         ScreenScale = true }

end

local function SongBackground()
    
    local Texture = beat4sprite.songBackgroundPath()            return Background(Texture)

end


local t = { Retro = Retro,          Background = Background,    SongBackground = SongBackground }

astro.merge( Builder, t )