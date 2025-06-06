
local astro = Astro.Table


local function hasAnimationType( self, name ) return self.beat4sprite:hasAnimationType(name) end


-- TODO: Use tapLua.spriteMatrix

local function pathMatrix(self)

    local path = self:GetTexture():GetPath()        if not FILEMAN:DoesFileExist(path) then return end    
    
    local x, y = path:match("(%d+)x(%d+)")          return Vector( tonumber(x), tonumber(y) )

end

-- To get the smallest path matrix number use math.min( Vector:unpack() ).


local function defaultStyle(self)

    local states = self.beat4sprite.States          local first, last = states.First, states.Last

    if first == last then return { { Frame = first } } end


    local p = {}        local step = last > first and 1 or -1

    for i = first, last, step do p[#p+1] = { Frame = i } end            return p

end

local Styles = {

    pingPong = function(self)
    
        local p = defaultStyle(self)            local reversed = astro.reversed(p)
    
        astro.add( p, reversed )                return p

    end

}

local function statesProperties(self)

    local states = self.beat4sprite.States          local types = states.Types

    for i,v in ipairs(types) do
    
        local style = Styles[v]         if style then return style(self) end
    
    end

    return defaultStyle(self)

end


local function cycleState( self, state ) return math.ceil(state) % self:GetNumStates() end

local function statesRate(self) return self.beat4sprite.States.Rate * self.statesDelay * self:rate() * 4 end


local function initSprite(self)

    self:set_use_effect_clock_for_texcoords(true)

    local n = self:GetNumStates()           if n < 2 then self.statesDelay = 1 return self end

    if self:hasAnimationType("Idle") then self:animate(false) end           self.statesDelay = 1 / n

    return self
    
end

local function initParticle( self, builder, i )

    local zoom = builder:zoom()             self:init(builder):initSprite():zoom(zoom)

    local properties = statesProperties(self)          self:SetStateProperties(properties)

    if not self:hasAnimationType("Position") then return end
    
    local s = self:cycleState(i)            self:setstate(s)
    
end


-- Update functions.

local function updateStateDelay(self)

    local isIdle = self:hasAnimationType("Idle")          if isIdle then return self end


    local n = self:GetNumStates()		if n <= 1 then return self end


    local last = self.lastStatesDelay         local current = self:statesRate()

    if last == current then return self end
        

    self:SetAllStateDelays(current)         self.lastStatesDelay = current
    
end


local Sprite = beat4sprite.Sprite

local merge = {
    
    hasAnimationType = hasAnimationType,        initSprite = initSprite,            initParticle = initParticle,

    pathMatrix = pathMatrix,          updateStateDelay = updateStateDelay,          statesProperties = statesProperties,

    setInitialState = setInitialState,          statesRate = statesRate,             cycleState = cycleState

}

astro.merge( Sprite, merge )