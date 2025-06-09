
local maxCoordinate = Astro.Vector.maxCoordinate


-- Returns the tapLua tile actor.

local input, AFT = beat4sprite.Arguments

local function setSize(self)

    local screenSize = tapLua.screenSize()          local size = self:GetSize()

    local max = maxCoordinate(size)         local k, length = max.key, max.value

    local screenLength = screenSize[k]          local isBigger = length > screenLength


    local zoom = isBigger and screenLength / length or 1
    
    zoom = zoom * 2 -- Double the resolution to keep it high quality.

    size = self:GetSize() * zoom             AFT:setSizeVector(size):zoom(zoom)

    self:basezoom(zoom)

end


-- Add spiral traversing function.

local spiral = tapLua.Load( "Sprite/Spiral" )

local function spiralIndex(self)

    local p = self:GetParent()          p.Spiral = p.Spiral or spiral(p)          local spiral = p.Spiral

    local i = self.Index          return spiral[i]

end

local function onChildren(self) self.spiralIndex = spiralIndex end


return tapLua.Load( "Sprite/Tile", input ) .. {

    PostInitCommand=function(self)

        self:RunCommandsOnChildren(onChildren)          self:queuecommand("SetSize")

    end,

    SetSizeCommand=function(self)

        AFT = self:GetParent()      setSize(self)       local size = AFT:GetSize()
        
        self:setPos( size * 0.5 )       if isQuad then return end       AFT:GetParent():queuecommand("LoadSprite")

    end

}