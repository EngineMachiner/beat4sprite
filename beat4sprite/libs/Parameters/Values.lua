
local paths = { "BGAnimations/", "Songs/", "Themes/" }
local function parsePaths(parameters)

	local p = parameters

	local file = p.File
	if type(file) == "string" then file = { file } end

	local output = {}
	for k, file in ipairs( file ) do

		if type(file) == "table" then output[k] = parsePaths( file ) else

			local isPathComplete = false
			for _, hint in ipairs(paths) do if file:match(hint) then isPathComplete = true end end

			if not isPathComplete then file = beat4sprite.Paths.Graphics .. file end

			output[k] = file

		end

	end

	p.File = output			return p -- Because of recursion.

end

local function fileData(parameters)

	local p = parameters
	local file = p.File			if not file then return end

	-- Store the sprite sheet matrix.
	if type(file) == "string" and p.Class == "Sprite" then

		-- Store the sprite sheet matrix.
		
		-- We do a little pattern string magic.
		local n = file:match(" %d*x%d*")

		if n then

			local n1, n2 = n:match("%d*x"), n:match("x%d*")		n = { n1, n2 }

			for i=1,#n do n[i] = n[i]:gsub('x', '')		n[i] = tonumber( n[i] ) end

			p.Sheet = { x = n[1], 	y = n[2] }

		end

		p.File = { file }

	end

	parsePaths(p)

	file = p.File		if #file == 1 then p.File = file[1] end

end

-- Matrix range just for Tile.lua.

local function checkOrder( tbl, name )

	local value = tbl[name]
	if value[1] > value[2] then tbl[name] = { value[2], value[1] } end

end

-- The tile range is started from the center and mirrored.
local rangePairs = { x = "Columns", y = "Rows" }
local scripts = { "Tile.lua", "Texture.lua", "Kaleidoscope" }
local function tileRange(parameters)

	local p = parameters
	
	local shouldStore = false
	for _, name in ipairs(scripts) do
		if p.Script:match(name) then shouldStore = true break end
	end

	if not shouldStore then return end

	local numberOf = {}
	for k,v in pairs(rangePairs) do

		local range = p[v]
		if type(range) == "number" then p[v] = { - math.abs(range), math.abs(range) } end		range = p[v]

		-- Flip the limits if they are not in the right order ( ascending order from left to right )
		checkOrder( p, v )

		-- Store number of items.
		numberOf[k] = range[2] - range[1] + 1

		if not p.OffCenter then
			range[1] = - math.floor( ( numberOf[k] - 1 ) * 0.5 )
			range[2] = math.ceil( ( numberOf[k] - 1 ) * 0.5 )
		end

	end

	-- Total number of items.
	numberOf.items = numberOf.x * numberOf.y		p.numberOf = numberOf

end

-- Global config custom animation rate per path / folder.
local rateByPath = beat4sprite.Config.rateByPath
local function checkRateByPath(parameters)

	local p = parameters

	local file = p.File

	if type(file) == "table" then return end

	if p.Config.RateByPath or not file then return end

	for name, rate in pairs( rateByPath ) do

		if file:match(name) and not p.Config.RateByPath then
			p.States.Rate = p.States.Rate * rate
			p.Config.RateByPath = rate				return
		end

	end

end

local statesPairs = {
	AnimationRate = "Rate", AnimationOffset = "Offset", AnimationTypes = "Types"
}

local function states(parameters)

	local p = parameters

	if p.Class ~= "Sprite" then p.States.Types = p.States.Types or {} return end

	-- 1.

	local first, last = p.firstState, p.lastState

	if not first and last then first = 1 end		last = last or first

	if first and last then p.States = { first, last } end

	p.firstState, p.lastState = nil

	-- 2.

	local config, states = p.Config, p.States

	if states and not config.States then

		if type(states) == "number" then

			if states < 0 then states = 1 end		states = { states, states }
			p.States = states

		end
		
		if type(states) == "table" then

			for i,v in ipairs(states) do
				local value = v - 1			if value < 0 then value = 0 end
				states[i] = value
			end

		end

		config.States = true

	end

	-- 3.

	if not states.Rate then states.Rate = 1 end

	-- 4. Parse direct parameters into the nested table.

	for k,v in pairs(statesPairs) do
		local value = p[k]			if value then states[v] = value			p[k] = nil end
	end

	-- 5.

	if not states.Types then states.Types = {} end

	-- 6.

	local stateType = states.Types
	if type(stateType) == "string" then states.Types = { stateType } end

	checkRateByPath(p)

end

local function scripts(parameters)

	local p = parameters

	local script, path = p.Script, beat4sprite.Paths.Templates

	if not script:match(".lua") then script = script .. ".lua" end
	p.Script = script

	local pathComplete = script:match(path) or script:match("default.lua")

	if pathComplete then return end			p.Script = path .. script

end

local function effects(parameters)

	local p = parameters

	p.EffectMagnitude = tapLua.Vector.toCoords( p.EffectMagnitude )

end

local posPairs = { x = "posX", y = "posY" }
local function positions(parameters)

	local p = parameters
	
	for k,v in pairs(posPairs) do
		local value = p[v]		if value then p.Pos[k] = value end		p[v] = nil
	end

	p.Pos = tapLua.Vector.toCoords( p.Pos )

end

local function spacing(parameters)

	local p = parameters

	local n = p.Spacing
	if type(n) == "number" then p.Spacing = { x = 1 + n, 		y = 1 + n } end		
	
	p.Spacing = tapLua.Vector.toCoords( p.Spacing )

end

local mirrorPairs = { x = "Rows", y = "Columns" }
local function mirror(parameters)

	local p = parameters

	if p.Script:match("SpecialMirror") then p.Mirror = true end

	-- 1.

	local mirror = {}				local extraRotation = { x = 0, y = 0 }
	local isZero = true

	for k,v in pairs(mirrorPairs) do

		local key = "Mirror" .. k:upper()

		if p[key] == v then 
			extraRotation[k] = 1	p[key] = nil	isZero = false 
		end

	end

	mirror[1] = extraRotation

	for k,v in pairs(mirrorPairs) do

		local key = "Mirror" .. k:upper()			local value = p[key] or 0
	
		if value == true then value = 1 end			if value ~= 0 then isZero = false end

		mirror[k] = value

	end

	if not isZero then p.Mirror = mirror end

	-- 2.

	if p.Mirror == true or not p.Mirror and p:hasCommand("Mirror") then 
		p.Mirror = { x = 1, y = 1, extraRotation }
	end

end

local scrollPairs = { x = "scrollX", y = "scrollY" }
local function scroll(parameters)

	local p = parameters

	if not p.Script:match("Tile") then return end

	if p.Move then p.Scroll = p.Move		p.Move = nil end

	-- 1.

	local scroll = p.Scroll				local meta = getmetatable(scroll)

	for k,v in pairs(scrollPairs) do 
		if p[v] then scroll[k] = p[v]		p[v] = nil end
	end

	-- 2.

	scroll = tapLua.Vector.toCoords(scroll)

	-- 3. Unitary Vector

	for k,v in pairs(scroll) do if v ~= 0 then scroll[k] = v / math.abs(v) end end

	p.Scroll = scroll

end

local function shade(parameters)

	local p = parameters

	if not p.Script:match("SpaceEffects") then return end

	if p:hasCommand("Shade") then p.Shade = true end

	local shade = p.Shade			if not shade then return end

	if shade == true then

		if p.Script:match("Particles.lua") then p.Shade = Color.Black return end

		p.Shade = { Color.White, Color.Black }		shade = p.Shade
		if p.Move == "Out" then p.Shade = { shade[2], shade[1] } end

	end

end

local rainbows = { "Rainbow", "RainbowFlashing" }
local function colors(parameters)

	local p = parameters		local color = p.Color

	if type(color) == "string" then

		local key
		for _, v in pairs(rainbows) do if color == v then key = v end end

		if not key then p.Color = { color(color) }
		else p[key] = true		p.Color = nil end

	end

	if tapLua.Color.is(color) then p.Color = { color } end
	color = p.Color

	if color then p.EffectColors[1] = color[1] end

	color = p.EffectColors
	if type(color) == "string" then p.EffectColors = { color(color) } end

	if tapLua.Color.is(color) then p.EffectColors = { color } end

end

local function blend(parameters) 

	local p = parameters

	-- Not Kaleidoscope Texture folder.
	if p.Script:match("Texture.lua") then return end

	if p.Blend == true then p.Blend = "BlendMode_Modulate" end 

end

local function fade(parameters)

	local p = parameters		local fade = p.Fade
	
	local amplitude = p.FadeAmplitude or 0.125
	if fade and not p.Config.FadeAmplitude then 
		amplitude = 1 / amplitude		p.Config.FadeAmplitude = true
	end
	
	p.FadeAmplitude = amplitude
	
	-- If not fade or fade was already defined by direction.
	local b = not fade and not p:hasCommand("Fade") or type(fade) == "string"
	
	if b then return end

	if fade == true or p:hasCommand("Fade") and not fade then fade = { x = 0, y = 0 } end

	fade = tapLua.Vector.toCoords(fade)			p.Fade = tapLua.Vector.toUnit(fade)

end

local function zoom(parameters)

	local p = parameters

	local zoomXYZ = p.ZoomXYZ			if not zoomXYZ then return end

	p.ZoomXYZ = tapLua.Vector.toCoords(zoomXYZ)

end

local function cross(parameters)
	
	local p = parameters

	if p.Script:match("Cyclic/") then return end

	local cross = p.Cross
	if type(cross) == "number" then cross = { By = cross, Type = 1 } end
	p.Cross = cross

end

local directionParameters = { "Fade", "Scroll", "Move" }
local function directions(parameters)

	local p = parameters

	for k,v in ipairs(directionParameters) do
		if type( p[v] ) == "string" then p[v] = tapLua.Vector.getByName( p[v] ) end
	end

end

local function oneCommand(parameters)

	local p = parameters		local commands = p.Commands
	
	if type(commands) == "string" then p.Commands = { commands } end

end

-- To be used with table.sort()
local last = { "SpecialMirror", "Scroll" }
local function commandSorter(tbl)

	for _, v1 in ipairs(tbl) do for _, v2 in ipairs(last) do 
		if v == v2 then return true end 
	end end

	return false

end

local commandToParameter = { 
	"Blink", "Rotation", "SpinFrame", "Blend", "Rainbow", "Mirror", "Cross"
}

local stateTypeCommands = {
	StairsStates = "Stairs",	LineStates = "Line",	RandomDelays = "Random Delays",
	RandomStates = "Random"
}

local function parameters(parameters)

	local p = parameters

	for k,v in ipairs(commandToParameter) do beat4sprite.Commands.toParameter(p, v) end

	local stateTypes = p.States.Types

	for k,v in pairs(stateTypeCommands) do
		local index = beat4sprite.Commands.has( p, k )
		if index then stateTypes[#stateTypes+1] = v		table.remove( p.Commands, index ) end
	end

end

local parameterToCommand = { 
	"Scroll", "Alpha", "Cross", "Shade", "Fade", "Mirror", "Pulse"
}

local function commands(parameters)

	local p = parameters

	local commands = p.Commands		if not commands then return end

	oneCommand(p)					commands = p.Commands

	for k,v in ipairs(parameterToCommand) do beat4sprite.Parameters.toCommand(p, v) end

	-- Sort commands that are queued at the end.
	table.sort( commands, commandSorter )		tapLua.Table.cleanDuplicates(commands)

	-- Scroll is meant for Tile.lua and Move is deprecated for it.
	local index = p:hasCommand("Move")
	if p.Script:match("Tile") and index then table.remove( commands, index ) end

end

local function actors(parameters)
	local p = parameters		local actors = p.Actors
	if actors and actors.Class then p.Actors = { actors } end
end

local function pulse(parameters)

	local p = parameters		local type = p.Pulse
	if type == true or p:hasCommand("Pulse") and not type then p.Pulse = 1 end

end

local function cyclic(parameters)

	local p = parameters

	if not p.Script:match("Cyclic/") then return end

	local set, file = p.Set, p.File

	if not set then

		if not file then error("File missing!") else
			set = {}		for k,v in pairs(file) do set[k] = { File = v } end
		end

	end

	set = beat4sprite.create( set, true )

	if set.File then set = { set } end

	p.Cycle = p.Cycle or { Time = p.CycleTime or 4, Offset = p.CycleOffset or 0 }
	p.CycleTime, p.CycleOffset = nil

	local totalTime = 0
	for k,v in ipairs(set) do

		v = v:getInternals()

		v.CycleTime = v.CycleTime or p.Cycle.Time or 4
	
		totalTime = totalTime + v.CycleTime
	
	end
	p.TotalTime = totalTime

	if #set == 1 then set = set[1] end			p.Set = set

end

local function adjust(parametersSet)

	local p = parametersSet

	scripts(p)			tileRange(p)		fileData(p)

	states(p)		oneCommand(p)		parameters(p)		directions(p)
	
	effects(p)		positions(p)	spacing(p)		mirror(p)		scroll(p)
	colors(p)		shade(p)		blend(p)		fade(p)			zoom(p)		
	cross(p)		actors(p)		pulse(p)		cyclic(p)

	commands(p)

	return beat4sprite

end

beat4sprite.storeAll { Parameters = { adjust = adjust } }

local toStore = { parsePaths = parsePaths,	fileData = fileData,	checkCommands = commands }
beat4sprite.store { Parameters = toStore }