
-- Needed custom table deep copy.
local functions = { "copy", "tweak", "Load" }
local function deepCopy(from)

	local copy = {}

	for k,v in pairs(from) do
		if type(v) == "table" then copy[k] = deepCopy(v) else copy[k] = v end 
	end

	for k,v in pairs(functions) do copy[v] = from[v] end

	copy.getInternals, copy.getRawInput = nil

	return copy

end

-- Parameter copy.
local function copy( from, to )
	
	local copy = deepCopy(from)		if not to then return copy end

	local copy2 = deepCopy(to)		beat4sprite.tweak(copy, copy2)			return copy

end

local function prepare(parameters)

	local p = parameters
	
	if #p == 0 then p = { p } end
	for i, set in ipairs(p) do set.Index = set.Index or i end

	return p

end

local function doAfter(parameters)

	local p = parameters
	if #p == 1 then p = p[1] end		return p

end

-- Parameters that won't be removed on Cleanup.
local exclude = { "Actors", "Config", "getInternals", "getRawInput", "Cleanup" }
local function onCleanup( p, t )

	local pi = p:getInternals()				local ti = t:getInternals()

	if not ti.Cleanup then return end

	for k,v in pairs(pi) do

		if not tapLua.Table.contains( exclude, k ) then pi[k], p[k] = nil end

	end

end

-- Remove parameters and commands.
local function remove(p, t)

	local pi = p:getInternals()			local ti = t:getInternals()

	beat4sprite.Parameters.checkCommands(pi)		local toRemove = ti.Remove

	if type(toRemove) == "string" then ti.Remove = { toRemove } end
	toRemove = ti.Remove

	if type(toRemove) ~= "table" then return end

	for k,v in ipairs(toRemove) do

		local index = beat4sprite.Commands.has( pi, v )
		if index then table.remove( pi.Commands, index ) end

		pi[v], p[v] = nil

	end

end

local statePatterns = { "States", "firstState", "lastState" }
local function setTweaks(p, t) 
	
	local pi = p:getInternals()			pi.Config = pi.Config or {}

	-- Temporal removal.
	local temp1, temp2 = t.getInternals, t.getRawInput
	t.getInternals, t.getRawInput = nil

	-- Merge inputs.
	for k,v in pairs(t) do
		if type(v) == "table" then v = deepCopy(v) end 		p[k] = v
	end

	-- Only add the input parameters not any defaults.
	for k,v in pairs(t) do

		if type(v) == "table" then v = deepCopy(v) end		pi[k] = v

		for a,b in pairs(statePatterns) do
			if b == k then pi.Config.States = false break end 
		end

	end

	-- Store them back.
	t.getInternals, t.getRawInput = temp1, temp2

	-- Remove indexes so they don't mess with internal scripts and for this to be a 1 time tweak.
	p.Index, pi.Index = nil

end

-- Change a single set of parameters compared to a single tweak set.
local function whileIterating( p, t )

	-- If they are not compatible return.
	local b = p.Index and t.Index and t.Index == p.Index
	b = not b or ( type(p) ~= "table" and type(t) ~= "table" )

	if b then return p end

	-- Create in case they don't exist.
	for _,v in pairs { p, t } do beat4sprite.LinkInternals(v) end

	remove(p, t)		onCleanup(p, t)			setTweaks(p, t)

	return p

end

-- Change parameters with tweaks.
local function tweak( params, tweaks ) 
	
	local p, t = params, tweaks			if not t or not p then return p end		
	
	if p.getRawInput then p = p.getRawInput() end

	p = prepare(p)		t = prepare(t)

	for _,set1 in ipairs(p) do 		for _,set2 in ipairs(t) do 
		set1 = whileIterating( set1, set2 )
	end end

	p = doAfter(p)		t = doAfter(t)				return p


end

beat4sprite.storeAll { tweak = tweak, copy = copy }
beat4sprite.store { deepCopy = deepCopy }