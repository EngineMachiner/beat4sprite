
local astro = Astro.Type            local isNumber = astro.isNumber             local isString = astro.isString

local Builder = beat4sprite.Builder


local function onStatesNumber(self)

    local states = self.States          if not isNumber(states) then return end

    local n = states        self.States = { First = n, Last = n, Rate = 1, Types = {} }
    
end

local keys = { "First", "Last" }

local function substract(self)

    local states = self.States

    for i,v in ipairs(keys) do states[v] = states[v] - 1 end

end

local function stateTypes(self)

    local states = self.States          local types = states.Types

    if not isString(types) then return end          states.Types = { types }

end

function Builder:setSpriteStates()

    onStatesNumber(self)    substract(self)     stateTypes(self)
    
    return self

end