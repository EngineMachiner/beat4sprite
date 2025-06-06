
-- 1st MIX builder set to double the rate, FOV to 170, double depth particles?

local isColor = tapLua.Color.isColor        local Config = beat4sprite.Config


local astro = Astro.Type            local isString = astro.isString

local isTable = astro.isTable


astro = Astro.Table           local Meta = astro.Meta

local Vector = Astro.Vector             local isVector = Vector.isVector


local Builder = beat4sprite.Builder


function Builder:setCommands(Commands)

    for i,v in ipairs(Commands) do   if self[v] then self.Commands:add(v) end   end

    return self

end

local onColor = {

    function(colors) return isColor(colors) and { colors } end,

    function(colors)
        
        local isString = isString(colors)           if not isString then return end

        if colors:match("Rainbow") then return { Type = colors } end

        return { color(colors) }
    
    end,

}

function Builder:setColors()

    local colors = self.Colors

    for i,v in ipairs(onColor) do
        
        local new = v(colors)          if new then self.Colors = new return self end
    
    end

    for i,v in ipairs(colors) do colors[i] = isString(v) and color(v) or v end

    return self

end

local function depthRate(self)

    local valid = { "Bounce", "Cascade", "Helix", "Spread" }          local script = self.Script

    local function isValid( k, v ) return script:match(v) end

    if not astro.contains( valid, isValid ) then return end

    self.Rate = self.Rate * 4

end

local function depthColors(self)

    local __index = { Color.White, Color.White }            local Colors = self.Colors

    Meta.setIndex( Colors, __index )

end

local function scaleQuantity(self)

    local n = self.Quantity          if self.Centered then return n end            

    n = n * SCREEN_WIDTH / SCREEN_HEIGHT        n = math.ceil(n)        self.Quantity = n

    return n

end

function Builder:onDepth()

    local FOV = Config.Depth.FOV

    local isDepth = self.Script:match("Depth")              if not isDepth then return self end

    self.FOV = self.FOV or FOV          self.scaleQuantity = scaleQuantity
    
    depthColors(self) depthRate(self)           return self

end

function Builder:setBlend()

    if self.Script:match("Texture") then return self end

    if self.Blend == true then self.Blend = Blend.Modulate end

    return self

end

function Builder:onCyclic()

    if not self.Script:match("Cyclic/") then return end


    local cycle = self.Cycle            local __index = { Time = { Layer = 4 }, Offset = 0 }

    self.Cycle = Meta.setIndex( cycle, __index )


    -- Calculate total time.

    cycle.Time.Total = cycle.Time.Layer * #self.Layers

end


local function wasSetup(self) return getmetatable(self).setup end

local function finishSetup(self) getmetatable(self).setup = true end


function Builder:setup()

    if wasSetup(self) then return self end

    self:setPaths():setSpriteStates()         self:onDepth():setColors():setBlend()

    finishSetup(self) return self

end