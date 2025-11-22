
local Vector = Astro.Vector             local planeAxes = Vector.planeAxes

local normSqr = Vector.normSqr          local config = beat4sprite.Config

local builder = ...             local Scroll = builder.Scroll


local orientation = 1           local skippedTime = 0

local function scrollSpeed()

    local players = GAMESTATE:GetEnabledPlayers()           local playerState = GAMESTATE:GetPlayerState( players[1] )
    
    local options = playerState:GetCurrentPlayerOptions()

    return options:ScrollSpeed() * 96 * orientation

end

local function scrollVelocity( self, isSkip )

    local velocity = Vector()

    local direction = Scroll.Direction          local size = self:GetZoomedSize()

    velocity = Vector.componentDivision( direction, size )


    local scrollSync = config.ScrollSync and self:isOnGameplay() and not isSkip

    if scrollSync then return velocity * scrollSpeed() end


    velocity = velocity * 2 / self:tweenRate()          return velocity * 120 * orientation

end

local function invertScroll(self) orientation = - orientation end

local function reverseTime( self, isSkip )

    local velocity = scrollVelocity( self, isSkip )
    
    for i,v in ipairs(planeAxes) do velocity[v] = math.abs( velocity[v] ) end

    local max = math.max( velocity:unpack() )           return 1 / max

end

local function onReverseScroll(self)

    if not Scroll.Reverse then return end           invertScroll(self)

    local time = reverseTime(self)          self:sleep(time):queuecommand("Scroll")

end

local function onReverseSkip( self, time )

    if not Scroll.Reverse then return end           skippedTime = skippedTime + time

    if skippedTime < reverseTime( self, true ) then return end
    
    invertScroll(self)      skippedTime = 0

end

local function onScrollSkipping(self)

    if not Scroll.Skip then return end


    local size = self:GetZoomedSize()

    for i,v in ipairs(planeAxes) do size[v] = math.min( size[v], 80 ) end
    
    
    local direction = Scroll.Direction * orientation
    
    local offset = Vector.componentProduct( direction, size )

    self:moveTextureBy( - offset )


    local time = self:tweenRate()           self:sleep(time)

    onReverseSkip( self, time )           self:queuecommand("Scroll")


    return true

end

return scrollVelocity, onReverseScroll, onScrollSkipping