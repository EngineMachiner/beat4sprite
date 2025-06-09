
local astro = Astro.Table           local Builder = beat4sprite.Builder

local builder = ...                 local Quad = builder.Quad           local isQuad = Quad == true


local function quadActor()

    if not Quad or isQuad then return end


    local input = builder:input()           local copy = astro.Copy.deep( input )
    
    copy.States = nil                       copy.Quad = true


    input = astro.merge( Quad, copy )       return Builder(input):Load()

end


local path = THEME:GetPathG( '', "_white" )

local function onQuad(self)
            
    if not isQuad then return end               local size = self:GetSize()

    self:Load(path):setSizeVector(size)

end


return quadActor, onQuad