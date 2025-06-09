
local Vector = Astro.Vector


local builder = ...             local Sprite = builder.Sprite or {}

local Wise = builder.CounterWise and -1 or 1             builder.Centered = true


local Display = builder.Display or function() return false end

local States = builder.States.Display or function(i) return i + 1 end


local Spin = builder.Spin           local Effect = builder.Effect

local FixedAngle = Effect.FixedAngle            local Magnitude = builder.Effect.Magnitude

if Spin and Magnitude.z == 0 then Magnitude.z = 45 * 0.5 end


local Waves = builder.Waves or 1            local Whirl = builder.Whirl

local Quantity = builder.Quantity or 8          if Whirl then Quantity = 32 end

builder.Quantity = Quantity


local n = builder:scaleQuantity()           local angleOffset = builder.Angle or 0


local Angle = 360 / n

local function angle(i)

    local i = i - 1             local angle = i * Angle * Wise           angle = angle % 360

    return math.rad(angle)

end


local Path = "Particles/Depth/Actors"

local MainFrame, _ActorFrame, _Particle = beat4sprite.Load( Path )( builder )

local function Frame( table )
    
    return beat4sprite.ActorFrame { OnCommand=function(self) self:init(builder) end } .. table

end


local function ActorFrame(i)

    local ActorFrame = _ActorFrame(i)           local Condition = not Display(i)

    local function OnCommand(self) if Spin then self:setEffect("spin") end end

    return Frame { Condition = Condition,      OnCommand = OnCommand,       ActorFrame }
    
end

local function Particle( i, s )

    return Frame {

        _Particle( i, s ) .. Sprite,
        
        OnCommand=function(self)

            self:GetChild("").Angle = Angle

            if not Spin or not FixedAngle then return end

            local Effect = self.Effect              local Magnitude = Effect.Magnitude
            
            Magnitude.z = - Magnitude.z             self:setEffect("spin")

        end

    }

end


local i, s = 0, 0           n = n * Waves

for x = 1, n do

    i = i + 1       s = States(s)       local angle = angle(i) + angleOffset


    local ActorFrame = ActorFrame(i)            MainFrame[i] = ActorFrame

    ActorFrame[1] = ActorFrame[1] .. {

        Particle( i, s ),

        OnCommand=function(self)

            local radius = SCREEN_CENTER_Y          self.Sleep = 0.5 / Waves

            local x = math.cos(angle)           local y = math.sin(angle)

            local pos = radius * Vector( x, y )         self:setPos(pos)

        end

    }

end


return MainFrame
