local params = ...          local p = params

p:tweak { Script = "Tile" }

local t = beat4sprite.ActorFrame()          beat4sprite.Sprite.bgTemplate(p):Load(t)

p:tweak { Columns = 2,      Rows = 1 }

local CommandName = "SpecialMirror"

local function specialMirror(self)

    local matrix = self.posMatrix
    local i, j = matrix.x, matrix.y

    local t = self:getTweenRate()

    if j == 0 then

        for _=1,2 do self:diffusealpha(1):sleep(t):diffusealpha(0):sleep(t) end
        return
        
    end

    local initPos = self.InitPos
    local dimensions = self.Dimensions
    local w, h, zoom = dimensions.w, dimensions.h, dimensions.Zoom

    local nextPos = {
        x = initPos.x - w * 0.25 * ( i * 2 - 1 ),
        y = initPos.y - h * j * 0.75
    }

    self:xy( initPos.x, initPos.y - h * 0.75 * j )
    self:rotationx( ( j - 1 ) * 90 + 60 ):zoom( zoom )

    for i=1,2 do
        self:diffusealpha(0):sleep(t):diffusealpha(1)
        if i == 1 then self:sleep(t) end
    end
            
    self:rotationx(0):zoom( zoom * 0.5 ):rotationx( 90 * ( j + 1 ) )
    self:xy( nextPos.x, nextPos.y ):sleep(t)

    self:queuecommand(CommandName)

end

p.Run = function(self)

    if not self:GetCommand(CommandName) then self:addcommand( CommandName, specialMirror ) end
    self:queuecommand(CommandName)

end

p:Load(t)

return t