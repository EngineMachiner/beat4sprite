
-- The main template is made for a sprite.

local nestedDefaults = { 
	Commands = {}, 									Config = {}, 
	Pos = { x = 0, y = 0 }, 						States = { 0, 0, Rate = 1 },
	Spacing = { x = 1, y = 1 },						Columns = { 0, 0 },
	Rows = { 0, 0 },								EffectColors = { Color.Black, Color.White }
}

local template = {
	Class = "Sprite",		tweenRate = 1,		Zoom = 1,		EffectOffset = 0,
	Script = beat4sprite.Paths.Templates .. "Tile.lua"
}

local function store(from) tapLua.Table.store( template, from ) end
template.store = store

-- Stores on both the template ( "on all parameters" ) and into the library itself.
beat4sprite.storeAll = function(toStore)
	store(toStore)		beat4sprite.store(toStore)
end

local function setMetaTables( to, meta, isTailCall )

	meta = meta or nestedDefaults

	for k,v in pairs( meta ) do

		if not to[k] then to[k] = {} end			local value = to[k]

		local meta = getmetatable(value) or { __index = v }

		if type(value) == "table" then setmetatable( value, meta ) end
		
	end

	if isTailCall then return end

	if to.Script:match("Tile") then
		setMetaTables( to, { Scroll = { x = 0, y = 0 } }, true )
	end

end

beat4sprite.store { template = template, setMetaTables = setMetaTables }