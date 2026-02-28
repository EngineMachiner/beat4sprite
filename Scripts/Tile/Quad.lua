
local builder = ...             local Quad = builder.Quad


local function quadActor()

    if not Quad or Quad == true then return end

    local builder = builder:merge { Quad = true,        States = {} }

    return builder:merge(Quad):Load()
    
end


local path = THEME:GetPathG( '', "_white" )

local function onQuad(self)

    if Quad ~= true then return end               local size = self:GetSize()

    self:Load(path):setSizeVector(size)

end


return quadActor, onQuad