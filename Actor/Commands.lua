
-- Cyclic commands because they queue forever on loop.

local degrees = { 90, 0 }


local function SpinX(self)
   
    local time = self:tweenRate()

    for i,v in ipairs(degrees) do self:linear(time):rotationy(v) end

    self:queuecommand( "Spin" )

end

local function SpinY(self)
   
    local time = self:tweenRate()

    for i,v in ipairs(degrees) do self:linear(time):rotationx(v) end

    self:queuecommand( "Spin" )

end

local function SpinXY(self)

    local time = self:tweenRate()

    for i,v in ipairs(degrees) do self:linear(time):rotationy(v) end
    for i,v in ipairs(degrees) do self:linear(time):rotationx(v) end

    self:queuecommand( "Spin" )

end


local function Pulse( self, scale )

    local time = self:tweenRate()       local zoom = self:GetZoom()         scale = scale or 0

    self:smooth(time):zoom( zoom * scale ):smooth(time):zoom(zoom)

    self:queuecommand("Pulse")

end

local function Pulse1(self) Pulse( self, 0 ) end
local function Pulse2(self) Pulse( self, 1.5 ) end


local function Alpha(self)

    local time = self:tweenRate()           local alpha = self:GetDiffuseAlpha()

    self:linear(time):diffusealpha(0):linear(time):diffusealpha(alpha)
    
    self:queuecommand("Alpha")

end


beat4sprite.Actor.Commands = {
    
    SpinX = SpinX,      SpinY = SpinY,      SpinXY = SpinXY,            Pulse1 = Pulse1,    Pulse2 = Pulse2,

    Alpha = Alpha

}