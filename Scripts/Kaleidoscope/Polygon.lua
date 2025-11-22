
local builder = ...             builder.Sides = builder.Sides or 8              local Sides = builder.Sides

if Sides < 3 then error("A polygon must have more than 2 sides!") end


local zoom = GetScreenAspectRatio()

local t = beat4sprite.ActorFrame {

    OnCommand=function(self) self:Center():zoom( 0.425 + zoom ) end,

    beat4sprite.Load( "Kaleidoscope/Pair" )( builder ) .. { OnCommand=function(self) Actor = self end }

}


local Angle = 180 / Sides

for i = 1, Sides do

    t[#t+1] = Def.ActorProxy {

        SetTargetCommand=function(self) self:SetTarget(Actor):rotationz( i * Angle * 2 ) end

    }

end


return t