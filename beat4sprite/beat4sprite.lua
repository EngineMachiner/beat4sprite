--[[
	Notes:
	- https://github.com/TeamRizu/OutFox/issues/426
	- Understanding how to make DoubleMirror and use File sets was hard.
]]

local Path = "/Appearance/Themes/_fallback/Modules/beat4sprite/"

beat4sprite = { 

	Paths = {
		Main = Path,	Libs = Path .. "libs/",		Templates = Path .. "Templates/",
		Graphics = Path .. "Graphics/"
	}

}

local function getBGAFile( bgaName, file )

	file = file or "default.lua"
	return "/BGAnimations/" .. bgaName .. "/" .. file

end

local function randomBGA() return loadfile( beat4sprite.Paths.Templates .. "RandomBGA.lua" )() end

local function store( from ) tapLua.Table.store( beat4sprite, from ) end
beat4sprite.store = store

store { Paths = { getBGAFile = getBGAFile }, randomBGA = randomBGA }

-- Load everything once.
local loadedFirst = { "Parameters/Meta.lua", "GameState.lua", "Sprite.lua", "Update.lua" }
for _, name in ipairs(loadedFirst) do LoadModule( "beat4sprite/libs/" .. name ) end

tapLua.OutFox.FILEMAN.LoadModules( beat4sprite.Paths.Libs, loadedFirst )