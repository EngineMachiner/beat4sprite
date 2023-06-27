
-- Useful to remove commands -> onCross() in Values.lua
local function has( parameters, command )

	local commands = parameters.Commands
	
	if not parameters or parameters and not commands then return false end

	return tapLua.Table.contains( commands, command ) -- Returns index if found.

end

local function add( parameters, command )

	local commands = parameters.Commands
	local hasCommand = has( parameters, command )
	
	if not hasCommand then commands[#commands+1] = command end

end

local function remove( parameters, commandName )

	local commands = parameters.Commands
	local index = has( parameters, commandName )

	if index then table.remove( commands, index ) end

end

-- Reads parameters to be set in the commands list.
local function toCommand( parameters, parseList )

	local commands = parameters.Commands		local s = parseList

	if type(s) == "string" then parseList = { Parameter = s,	Command = s } end

	local k, v = parseList.Parameter, parseList.Command

	-- If the parameter exists and the command doesn't then...
	if parameters[k] and not has( parameters, v ) then commands[#commands+1] = v end
	
end

-- Command to parameter.
local function toParameter( parameters, parseList )

	if type(parseList) == "string" then
		parseList = { Command = parseList,	Parameter = parseList } 
	end

	local k, v = parseList.Command, parseList.Parameter

	local commands = parameters.Commands

	local index = has( parameters, k )

	if not parameters[v] and index then

		parameters[v] = parseList.Value or true		table.remove(commands, index)

	end

end

beat4sprite.template.store {

	hasCommand = has,		addCommand = add,		removeCommand = remove

}

beat4sprite.store {

	Parameters = { toCommand = toCommand },

	Commands = {

		has = has,		add = add,		remove = remove, 		toParameter = toParameter
	
	}

}