
-- Useful to remove commands -> onCross() in Values.lua
local function has( params, command )

	local commands = params.Commands
	
	if not params or params and not commands then return false end

	return tapLua.Table.contains( commands, command )		-- Returns index if found.

end

local function add( params, command )

	local hasCommand = has( params, command )
	local commandList = params.Commands

	if not hasCommand then commandList[ #commandList + 1 ] = command end

end

local function remove( params, commandName )

	local index = has( params, commandName )
	local commands = params.Commands

	if index then table.remove( commands, index ) end

end

-- Sets the commands table based on the parameters
local function toCommand( params, paramToCmd )

	local cmds = params.Commands		local s = paramToCmd

	if type(s) == "string" then paramToCmd = { Parameter = s,	Command = s } end

	local k, v = paramToCmd.Parameter, paramToCmd.Command

	-- if the parameter exists and the command doesn't then...
	if params[k] and not has( params, v ) then
		cmds[#cmds+1] = v
	end
	
end

-- Command to parameter.
local function toParameter( params, cmdToParam )

	local cmds = params.Commands		local t = cmdToParam

	if type(t) == "string" then cmdToParam = { Command = t,	Parameter = t } end

	local k, v = cmdToParam.Command, cmdToParam.Parameter

	-- If the command exists and the parameter doesn't then...
	local index = has( params, k )
	if not params[v] and index then

		params[v] = cmdToParam.Value or true		table.remove(cmds, index)
			
	end

end

beat4sprite.template.store { hasCommand = has, addCommand = add, removeCommand = remove }

beat4sprite.store {

	Parameters = { toCommand = toCommand },

	Commands = { 
		has = has, add = add, remove = remove, 
		toParameter = toParameter
	}

}