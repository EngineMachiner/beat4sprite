
local astro = Astro.Type                        local isTable = astro.isTable

local isObject = tapLua.Type.isObject           local resolve = tapLua.resolvePath


local Builder = beat4sprite.Builder         local stackLevel

local function path( table, key, directory )

    local path = table[key]         local astro = path:Astro()


    local isAbsolute = astro:startsWith("[\\/]")

    if isAbsolute then return path end


    local isRelative = astro:startsWith("%.")

    if isRelative then return resolve( path, stackLevel + 3 ) end
    

    return beat4sprite.Path .. directory  .. path

end

local function setPath( self, key, folder )
    
    folder = folder or key .. "s"               folder = folder .. '/'


    local value = self[key]         if not value or isObject(value) then return value end

    if not isTable(value) then self[key] = path( self, key, folder ) return end


    for i,v in ipairs(value) do value[i] = path( value, i, folder ) end

end

local function wrapScriptPath(self)

    local script = self.Script              local endsWith = script:Astro():endsWith("%.lua")
    
    if not endsWith then self.Script = script .. ".lua" end

end

function Builder:setPaths()

    stackLevel = self:stackLevel()                  wrapScriptPath(self)
    
    setPath( self, "Texture", "Resources" )         setPath( self, "Script" )           return self

end