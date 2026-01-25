
-- It's a builder that returns actors based on different keys and values.

local isNumber = Astro.Type.isNumber

local Vector = Astro.Vector             local deepMerge = tapLua.deepMerge

local astro = Astro.Table               local deepCopy = astro.Copy.deep

local setIndex = astro.Meta.setIndex


local Builder = {}          local stackLevel = 2

local function isSingle(tbl) local key = next(tbl)        return not isNumber(key) end

local function wrap(input) return isSingle(input) and { input } or input end


-- Array of builders functions.

local function Load( builders )

    if not builders.Load then builders = Builder(builders) end

    local wrap = wrap(builders)        local t = beat4sprite.ActorFrame {}

    for i,v in ipairs(wrap) do t[#t+1] = v:Load() end

    return t

end

local function inputs( builders )

    local inputs = {}
    
    for i,v in ipairs(builders) do
        
        local input = v:input()         inputs[i] = deepCopy(input)
    
    end

    return inputs

end

local function merge( builders, input )

    if not input then return builders end
    
    local wrap = wrap(input)        local merged = deepCopy( builders )
    
    for k,v in pairs(wrap) do merged[k] = merged[k]:merge(v) end

    return merged

end


local __index = { Load = Load, merge = merge, inputs = inputs }

local function __call( Builder, input )

    local wrap = wrap(input)        setIndex( wrap, __index )

    for i,v in ipairs(wrap) do wrap[i] = Builder.init(v) end

    stackLevel = 2          return isSingle(input) and wrap[1] or wrap

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

Builder.init = function( input )

    local builder = deepMerge( defaults(), input )

    local meta = { __index = metaBuilder, input = input, Builder = Builder, stackLevel = stackLevel }

    setmetatable( builder, meta )


    builder.Commands = Builder.Commands( input )

    return builder:setup()

end


-- Set a default background using the back layer using the texture.

local function morphBackground(self)

    local script = self.Script

    if not script:match("Morph/") then return end

    if script:match("Morph/Split") or script:match("Morph/Stretch") then return end


    local layers = self.Layers          if layers.Back ~= nil then return end

    local Texture = self.Texture        layers.Back = Builder.Background(Texture):Load()

end

local textureScripts = {
    
    "Kaleidoscope/Tile.lua",        "Kaleidoscope/Triangle.lua",
    "Morph/Stretch.lua",            "Tile/Tile.lua"

}

function Builder:Load()

    if not self.Load then stackLevel = 3        return Load(self) end -- If Builder.Load(builders) happens.

    if not self.Texture then error("Missing texture!") end          morphBackground(self)


    local Builder = self                    local Layers = Builder.Layers

    local Script = Builder.Script           local Main = loadfile(Script)(Builder)


    local Alpha = Builder.Alpha

    local function isValid( k, v ) return Script:match(v) end

    local isTexture = astro.contains( textureScripts, isValid )

    Main = Def.ActorFrame {
        
        Main,       OnCommand=function(self) if not isTexture then self:diffusealpha(Alpha) end end
    
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
    
    deepMerge( copy, input )                    local Builder = getmetatable(self).Builder

    return Builder(copy)

end

function Builder:input() return getmetatable(self).input end

function Builder:zoom() return self.Zoom * self.Scale end

function Builder:hasAnimationType(name)

    local types = self.States.Types         return astro.contains( types, name )

end


function Builder:stackLevel() return getmetatable(self).stackLevel end

function Builder:addStackLevel(n) getmetatable(self).stackLevel = self:stackLevel() + n end


beat4sprite.Builder = Builder

tapLua.FILEMAN.LoadDirectory( beat4sprite.Path .. "Builder/" )

metaBuilder = deepCopy(Builder)         metaBuilder.Retro = nil


-- Builder templates for easy creation.

local function Background( Texture )

    return Builder { Texture = Texture,     Mirror = true,      ScreenScale = true }

end

local function Background2( Texture ) -- Matrix must be defined in the input.

    return Background(Texture):merge {
        
        Dynamic = true,     Output = { TextureCommand=function(self) self:scale_or_crop_background() end }
    
    }

end

local function SongBackground()
    
    local Texture = beat4sprite.songBackgroundPath()            return Background(Texture)

end


local t = { Background = Background,    Background2 = Background2,      SongBackground = SongBackground }

astro.merge( Builder, t )