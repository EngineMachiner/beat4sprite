
local setDefaults = function() end

-- Load actors in the Actor parameter table.
local function loadExtraActors( parameter, frame )

	local back, front = frame.Back, frame.Front
	local actors = parameter.Actors or {}

	for k,v in pairs(actors) do
		
		if not v.Added then

			local selected = front

			if v.onBackground then selected = back end

			selected[#selected+1] = v

			v.Added = true

		end
		
	end

end

-- Scripts that need a files table.
local function needsFiles(parameters)

	local script = parameters.Script
	return script:match("Cyclic") and not script:match("Actor.lua")

end

local function addSets( tree, frame )

	for _,set in ipairs(tree) do

		if type(set) == "table" then

			local child = Def.ActorFrame{}			frame[#frame+1] = child
			beat4sprite.add(set, child)

		end

	end

end

-- Algorithm that creates actors according to the parameters.
local function add( parameters, frame )

	local p, f = parameters, frame

	if #p == 0 and p.getInternals then p = p:getInternals() end

	local file = p.File				local tweakScript = p.tweakScript

	if tweakScript and parameters.getInternals then p = parameters end
	
	if p.Remove == true then return end

	if #p > 0 and not tweakScript then addSets(p, f) else

		-- A multiple files set.

		if type(file) == "table" and not needsFiles(p) then

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

				single.File = p.File[i]
				single.FileData = { index = i, numberOf = #file }

				setDefaults(single, true)

				-- This is unique. Not just a tweak or copy.
				single:getInternals().Set = actors	

				local child = Def.ActorFrame{}		f[#f+1] = child
				beat4sprite.add( single, child )

			end

		else

			-- Just one file and one script.

			-- Remove index so they don't mess with internal scripts.
			parameters.Index, p.Index = nil
			parameters.Cleanup, p.Cleanup = nil

			local script = p.Script

			--
			
			local actors = p.Actors
			if actors and #actors > 0 then
				f.Back = Def.ActorFrame{}	f.Front = Def.ActorFrame{}
				loadExtraActors(p, f)
			end

			--

			local middle = Def.ActorFrame{}

			if tweakScript then script = tweakScript		p.tweakScript = nil end

			local isCyclic = script:match("Cyclic")
			
			if not script and not tweakScript then error("Missing script.") end

			if p.File and script or tweakScript or isCyclic then 
				middle[#middle+1] = loadfile(script)(p) 
			end

			f.Middle = middle

			--

			f[#f+1] = f.Back		f[#f+1] = middle		f[#f+1] = f.Front

		end

	end

end

-- Keep link between inputs and internals.
local function LinkInternals(parameters)

	local p = parameters

	if p.getInternals then return end

	local template = { __index = beat4sprite.template }
	
	local internals = setmetatable( beat4sprite.deepCopy(p), template )

	internals.getRawInput = function() return p end
	p.getInternals = function() return internals end

end

local operations = { "Load", "tweak", "copy" }
local function addOperations(parameters)
	local p = parameters
	if not p.Load then for _,v in ipairs(operations) do p[v] = beat4sprite[v] end end
end

-- Sets metatable defaults, operations and links internals and raw inputs.
setDefaults = function( p, isFinal )

	if #p == 0 then

		LinkInternals(p)
		
		local i = p:getInternals()		beat4sprite.setMetaTables(i)

		if isFinal then beat4sprite.Parameters.adjust(i).setMetaTables(i) end

	end

	for _,v in ipairs(p) do if type(v) == "table" then setDefaults( v, isFinal ) end end

	addOperations(p)

end

-- Every input parameter set has a copy that will do all the processing based on the inputs.
local function create( parameters, isFinal )

	if not parameters then isFinal = true end

	-- These are already added to the sprite template.
	parameters = parameters or {}		setDefaults( parameters, isFinal )			
	
	return parameters
	
end

-- Gets final and direct internals.
local function createInternals( parameters ) return create( parameters, true ):getInternals() end

-- Load is the main function to create any set.
local function Load( parameters, frame )

	if parameters.getRawInput then parameters = parameters.getRawInput() end

	frame = frame or Def.ActorFrame{}

	create(parameters, true)						
	
	if #parameters == 0 then parameters = { parameters } end
	add(parameters, frame)

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