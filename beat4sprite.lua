
local astro = Astro.Table


local animationsDirectory = "/BGAnimations/"            local path = "/Appearance/Themes/_fallback/Modules/beat4sprite/"

if tapLua.isLegacy() then path = "/Modules/beat4sprite/" end

beat4sprite = { Path = path,        Modules = {} }


-- TODO: Color saturation config is not supported.

local function z(offset) local depth = 250           local i = 1 + offset         return depth * i end

beat4sprite.Config = {
    
    ScrollSync = false,       PreviewRate = 0.5,       MorphLayers = 64,

    Depth = {   Range = { - z(3),     z( - 0.75 ) },         FOV = 160   }

}

-- To do tail calls in Lua 5.1 properly without it panicking I have to store the returned value in a variable first.

local function Load(name)

    local loaded = loadfile( path .. "Scripts/" .. name .. ".lua" );            return loaded

end

local function filePath( name, file )

	file = file or "default.lua"

	return animationsDirectory .. name .. "/" .. file

end

local function randomAnimation()
    
    local animations = FILEMAN:GetDirListing( animationsDirectory, true )

    local path = astro.random(animations)         path = filePath(path)

    return loadfile(path)()

end

local function songBackgroundPath() return GAMESTATE:GetCurrentSong():GetBackgroundPath() end


astro.merge( beat4sprite, {

    Load = Load,        filePath = filePath,        randomAnimation = randomAnimation,

    songBackgroundPath = songBackgroundPath

} )


local LoadDirectory = tapLua.FILEMAN.LoadDirectory              local directories = { "Actor", "Builder", "Modules" }

for i,v in ipairs(directories) do LoadDirectory( path .. v .. '/' ) end


-- Should this be added to Astro?

local Vector = Astro.Vector             local planeAxes = Vector.planeAxes

Vector.maxCoordinate = function(vector)

    local maxKey, maxValue

    for i,v in ipairs(planeAxes) do
        
        local value = vector[v]

        if not maxKey or value > maxValue then maxKey = v      maxValue = value end
    
    end

    return astro.pair( maxKey, maxValue )

end