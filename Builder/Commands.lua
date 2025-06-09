
local Meta = Astro.Table.Meta

local isString = Astro.Type.isString

-- It's the commands array containing the commands to be played.

local function __call( Commands, input )
    
    local commands = input.Commands or { "Rotation", "Colors" }

    if isString(commands) then commands = { commands } end

    return Meta.setIndex( commands, Commands ) -- __index == Commands

end

local Commands = setmetatable( {}, { __call = __call } )


Commands.find = Astro.Table.find

function Commands:add(command)

    local value = self:find(command).value          if value then return end

    table.insert( self, command )

end

function Commands:sub(command)

    local i = self:find(command).key          if not i then return end

	table.remove( self, i )

end

beat4sprite.Builder.Commands = Commands
