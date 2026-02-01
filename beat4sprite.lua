
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

    local loaded = loadfile( path .. "Scripts/" .. name .. ".lua" )         return loaded

end

local function animationPath( name, file )

	file = file or "default.lua"            return animationsDirectory .. name .. "/" .. file

end

local function randomAnimation()
    
    local animations = FILEMAN:GetDirListing( animationsDirectory, true )

    local path = astro.random(animations)         path = animationPath(path)         return loadfile(path)()

end

local function songBackgroundPath() return GAMESTATE:GetCurrentSong():GetBackgroundPath() end

local function Movie(data)
    
    local loaded = loadfile( path .. "Movie/Actor.lua" )(data)          return loaded

end


astro.merge( beat4sprite, {

    Load = Load,        animationPath = animationPath,        randomAnimation = randomAnimation,

    songBackgroundPath = songBackgroundPath,        Movie = Movie

} )


local FILEMAN = tapLua.FILEMAN

local directories = { "Builder", "Modules" }

for i,v in ipairs(directories) do FILEMAN.LoadDirectory( path .. v .. '/' ) end

FILEMAN.LoadModule( "beat4sprite/Actor/Actor.lua" )
FILEMAN.LoadModule( "beat4sprite/BPMTracking.lua" )