
local astro = Astro.Table               local Builder = beat4sprite.Builder

local builder = ...                     local Quad = builder.Quad

local deepCopy = astro.Copy.deep        local deepMerge = tapLua.deepMerge


local function quadActor()

    if not Quad or Quad == true then return end

    local builder = builder:merge { Quad = true,        States = {} }

    return builder:merge(Quad):Load()
    
end


local path = THEME:GetPathG( '', "_white" )

local function onQuad(self)

    if Quad ~= true then return end               local size = self:GetSize()

    self:LoadBy(path):setSizeVector(size)

end


return quadActor, onQuad