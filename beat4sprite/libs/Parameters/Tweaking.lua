
-- "main" in the function parameters are either a single parameter set 
-- or many nested sets in a table.

local operations = { "Load", "tweak", "copy" }

-- Custom table deep copy function.
local function deepCopy(from)

	local copy = {}

	for k,v in pairs(from) do
		if type(v) == "table" then copy[k] = deepCopy(v) else copy[k] = v end 
	end

	for k,v in pairs(operations) do copy[v] = from[v] end

	copy.getInternals, copy.getRawInput = nil

	return copy

end

-- Parameter copy function.
local function copy( from, to )

	local copy = deepCopy(from)		if not to then return copy end

	local copy2 = deepCopy(to)		beat4sprite.tweak( copy, copy2 )	return copy

end

local function pre(main)

	local p = main		if #p == 0 then p = { p } end

	for i, set in ipairs(p) do set.Index = set.Index or i end

	return p

end

local function post(main)
	local p = main		if #p == 1 then p = p[1] end		return p
end

-- Parameters that won't be removed on Cleanup.
local exclude = { "Actors", "Config", "getInternals", "getRawInput", "Cleanup" }
local function onCleanup( paramaters, tweak )

	local p, t = paramaters, tweak

	local pi = p:getInternals()				local ti = t:getInternals()

	if not ti.Cleanup then return end

	for k,v in pairs(pi) do

		if not tapLua.Table.contains( exclude, k ) then pi[k], p[k] = nil end

	end

end

-- Remove parameters and commands.
local function remove( paramaters, tweak )

	local p, t = paramaters, tweak

	local pi = p:getInternals()			local ti = t:getInternals()

	beat4sprite.Parameters.checkCommands(pi)

	local toRemove = ti.Remove
	if type(toRemove) == "string" then ti.Remove = { toRemove } end
	if type(toRemove) ~= "table" then return end
	toRemove = ti.Remove

	for k,v in ipairs(toRemove) do

		local index = pi:hasCommand(v)
		if index then table.remove( pi.Commands, index ) end

		pi[v], p[v] = nil

	end

end

local function merge( tableTo, key, value )

	if type(value) == "table" then value = deepCopy(value) end

	tableTo[key] = value

end

local keys = { "States", "firstState", "lastState" }
local function setTweaks( paramaters, tweak ) 

	local p, t = paramaters, tweak

	local pi = p:getInternals()			pi.Config = pi.Config or {}

	-- Temporal removal.
	local temp1, temp2 = t.getInternals, t.getRawInput
	t.getInternals, t.getRawInput = nil

	-- Merge inputs and internals.
	for k,v in pairs(t) do

		merge( p, k, v )		merge( pi, k, v )

		-- If the states changed then update them upon actor creation.
		for _, key in pairs(keys) do if key == k then pi.Config.States = false break end end

	end

	-- Store them back.
	t.getInternals, t.getRawInput = temp1, temp2

	-- Remove indexes so they don't mess with internal scripts and for this to be a 1 time tweak.
	p.Index, pi.Index = nil

end

-- Tweak a single set of parameters based of a single tweak set.
local function whileIterating( paramaters, tweak )

	local p, t = paramaters, tweak

	-- Do not tweak if their indexes are different.
	local shouldTweak = p.Index and t.Index and t.Index == p.Index

	if not shouldTweak then return p end

	-- Create links in case they don't exist.
	for _, v in pairs { p, t } do beat4sprite.LinkInternals(v) end

	remove( p, t )		onCleanup( p, t )			setTweaks( p, t )

	return p

end

-- Tweak parameters using tweaks sets.
local function tweak( main, tweaks ) 
	
	local p, t = main, tweaks			if not t or not p then return p end		
	
	if p.getRawInput then p = p.getRawInput() end

	p = pre(p)		t = pre(t)

	for _, set1 in ipairs(p) do for _, set2 in ipairs(t) do 
		set1 = whileIterating( set1, set2 )
	end	end

	p = post(p)		t = post(t)				return p

end

beat4sprite.storeAll { tweak = tweak, copy = copy }
beat4sprite.store { deepCopy = deepCopy }