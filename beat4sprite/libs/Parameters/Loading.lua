
-- "main" in the function parameters are either a single parameter set 
-- or many nested sets in a table.

local setDefaults = function() end

-- Create and insert actors in a frame.
local function insert( parameters, frame )

	local child = Def.ActorFrame{}			frame[#frame+1] = child

	beat4sprite.add( parameters, child )

end

local function loadExtraActors( parameters, frame )

	local back, front = frame.Back, frame.Front
	local actors = parameters.Actors or {}

	for _, actor in pairs(actors) do
		
		if not actor.Added then

			local selected = front

			if actor.onBackground then selected = back end

			selected[#selected+1] = actor		actor.Added = true

		end
		
	end

end

local function needsFiles(parameters)

	local script = parameters.Script
	return script:match("Cyclic") and not script:match("Actor.lua")

end

-- Add nested parameter sets.
local function addSets( sets, frame )

	for _, set in ipairs(sets) do

		if type(set) == "table" then insert( set, frame ) end

	end

end

-- Algorithm that creates actors according to the parameters.
-- This function is used for parameter sets.
local function add( main, frame )

	local p, f = main, frame

	if #p == 0 and p.getInternals then p = p:getInternals() end

	local tweakScript = p.tweakScript

	if tweakScript and main.getInternals then p = main end

	if p.Remove == true then return end

	local file = p.File

	if #p > 0 and not tweakScript then addSets(p, f) else

		if type(file) == "table" and not needsFiles(p) then

			-- A multiple files set case.

			if p.Columns[1] == p.Columns[2] and not tapLua.Vector.isZero( p.Scroll ) then
				p.Columns[2] = p.Columns[2] + 2			p.Rows[2] = p.Rows[2] + 1
			end

			if p.Reversed == "DoubleMirror" then
				p.Columns[2] = p.Columns[2] + math.abs( p.Scroll.x )
				p.Rows[2] = p.Rows[2] + math.abs( p.Scroll.y )
				p.Mirror = true
			end

			local actors = {}		-- To store examples of the files.

			-- Load files set.

			for i = 1, #file do

				local single = p:copy()

				single.File = file[i]
				single.FileData = { index = i, numberOf = #file }

				setDefaults( single, true )

				-- This is a unique list, accessible. Not just a tweak or copy.
				single:getInternals().Set = actors

				insert( single, f )

			end

		else

			-- Just one file and one script.
			-- 3 layers in case there's extra actors in the sets.

			-- Remove index so they don't mess with internal scripts.

			main.Index, p.Index = nil
			main.Cleanup, p.Cleanup = nil

			local script = p.Script

			-- Extra actors.
			
			local actors = p.Actors

			if actors and #actors > 0 then

				f.Back = Def.ActorFrame{}	f.Front = Def.ActorFrame{}
				loadExtraActors( p, f )

			end

			-- Middle layer with main set stuff.

			local middle = Def.ActorFrame{}

			if tweakScript then script = tweakScript		p.tweakScript = nil end

			local isCyclic = script:match("Cyclic")
			
			if not script and not tweakScript then error("Missing script.") end

			if file and script or tweakScript or isCyclic then 
				middle[#middle+1] = loadfile(script)(p) 
			end

			f.Middle = middle

			-- Add the layers to the frame.

			f[#f+1] = f.Back		f[#f+1] = middle		f[#f+1] = f.Front

		end

	end

end

-- Keep link between inputs and internals.
local function LinkInternals(parameters)

	local p = parameters		if p.getInternals then return end

	local template = { __index = beat4sprite.template }

	local internals = setmetatable( beat4sprite.deepCopy(p), template )

	internals.getRawInput = function() return p end
	p.getInternals = function() return internals end

end

local operations = { "Load", "tweak", "copy" }
local function addOperations(main)

	local p = main		if p.Load then return end		-- Do not create if it's already there.

	for _, key in ipairs(operations) do p[key] = beat4sprite[key] end

end

-- Sets metatable defaults, operations and links internals and raw inputs.
setDefaults = function( main, isFinal )

	local p = main

	if #p == 0 then

		LinkInternals(p)
		
		local i = p:getInternals()		beat4sprite.setMetaTables(i)

		if isFinal then beat4sprite.Parameters.adjust(i).setMetaTables(i) end

	end

	for _,v in ipairs(p) do if type(v) == "table" then setDefaults( v, isFinal ) end end

	addOperations(p)

end

-- Every input parameter set has a copy that will do all the processing based on the inputs.
local function create( main, isFinal )

	if not main then isFinal = true end

	-- These are already added to the sprite template.
	main = main or {}		setDefaults( main, isFinal )			
	
	return main
	
end

-- Gets final and direct internals.
local function createInternals(main) return create( main, true ):getInternals() end

-- Load is the main function to create any set.
local function Load( main, frame )

	if main.getRawInput then main = main.getRawInput() end

	frame = frame or Def.ActorFrame{}		create( main, true )						
	
	if #main == 0 then main = { main } end		add( main, frame )

	return beat4sprite.ActorFrame() .. {

		-- So we can look up without indexing a lot.
		getParameterActor=function( parameterIndex, layerName )

			parameterIndex = parameterIndex or 1
			layerName = layerName or "Middle"

			return frame[parameterIndex][layerName]

		end,

		frame,	InitCommand=function(self)
			-- Test for everything broken on beat <= 0.
			-- if beat4sprite.GAMESTATE.isOnGameplay() then self:playcommand("On") end
		end

	}

end

beat4sprite.storeAll { Load = Load }
			
beat4sprite.store { 
	create = create, createInternals = createInternals,
	add = add, LinkInternals = LinkInternals
}