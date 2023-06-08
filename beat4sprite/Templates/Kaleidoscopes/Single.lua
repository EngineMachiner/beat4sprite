
local params = ...      local p = params

p.RadialScroll = p.RadialScroll ~= nil and p.RadialScroll or true

p.Sides = p.Sides or 6
if p.Sides < 3 then p.Sides = 3 end         if p.Sides > 10 then p.Sides = 10 end
local sides = p.Sides

local isComb = p.Script:match("Comb.lua")

local t = Def.ActorFrame{ OnCommand=function(self)
    if not isComb then self:Center():zoom(2.125) end       self:rotationz(90)
end }

-- Literally...
local radialZoom = { 
    [3] = 3.67,		[4] = 2.125,        [5] = 1.53,	    [6] = 1.225,	    [7] = 1.015,
	[8] = 0.87,	    [9] = 0.77,	        [10] = 0.69
}

for i = 1, sides do

    local actor = Def.ActorProxy {}

    if i == 1 then
        actor = loadfile( beat4sprite.Paths.Templates .. "Kaleidoscopes/Texture/Triangle.lua" )(p)
    end

    t[ i + 1 ] = actor .. {

        OnCommand=function(self)

            local rotation = - ( i - 1 ) * 360 / sides
            self:queuecommand("Target"):rotationz(rotation)

            if p.RadialScroll then self:zoomy( self:GetZoomY() * radialZoom[p.Sides] ) end

        end,

        TargetCommand=function(self)
            if i == 1 then return end           self:SetTarget( p.Target ) 
        end

    }

end

return t