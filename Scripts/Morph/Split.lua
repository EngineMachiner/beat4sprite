
--[[

    Returns a 4 set of sprites with a texture that splits across the screen diagonally.

    Distribution:

    | 1 | 2 |
    | 3 | 4 |

]]

local Vector = Astro.Vector

local builder = ...             local reversed = builder.Reversed

local t = Def.ActorFrame {}

local Crop = {

    function(self) self:cropbottom(0.5):cropright(0.5) end,
    function(self) self:cropbottom(0.5):cropleft(0.5) end,

    function(self) self:croptop(0.5):cropright(0.5) end,
    function(self) self:croptop(0.5):cropleft(0.5) end

}


local function direction(x) return x * 2 - 3 end

local function add( row, column )

    local positions             local startPos = tapLua.center()

    local row, column = direction(row), direction(column)

    local function endPos(self)

        local h = self:GetZoomedHeight() * 0.5

        return startPos + Vector( h * column, h * row )

    end
    

    local i = #t + 1

    t[i] = beat4sprite.Sprite {

        Texture = builder.Texture,

        ReverseCommand=function(self) reversed = true end,

        OnCommand=function(self)
            
            self:init(builder):fitInScreen()            local crop = Crop[i]    crop(self)


            local endPos = endPos(self)         positions = { startPos, endPos }
            
            if reversed then positions = { endPos, startPos } end


            self:playcommand("Prepare")

        end,

        PrepareCommand=function(self)

            local startPos = positions[1]           self:setPos(startPos)

        end,

        MotionCommand=function(self)

            local rate = self:tweenRate()          local endPos = positions[2]

            self:linear(rate):setPos(endPos)

        end

    }

end

for i = 1, 2 do for j = 1, 2 do add( i, j ) end end

return t