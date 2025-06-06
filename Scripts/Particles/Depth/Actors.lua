
local reverse = Astro.Table.Array.reverse           local z = beat4sprite.Config.Depth.Range


local builder = ...             local FOV = builder.FOV             local Texture = builder.Texture

local Reversed = builder.Reversed           local colors = builder.Colors           

local n = builder:scaleQuantity()


local min, max = table.unpack(z)                local depthLength = max - min

if Reversed then z = reverse(z)         colors = reverse(colors) end


local function Frame( table )
    
    return beat4sprite.ActorFrame { OnCommand=function(self) self:init(builder) end } .. table

end

local MainFrame = Frame { OnCommand=function(self) self:setupDepth(FOV) end }


local function alpha(current)

    local length = 100             local max = max - length

    if current < min + length then
        
        current = current - min             return current / length
    
    elseif current > max then
    
        current = current - max             current = current / length
        
        return 1 - current
    
    end

    return 1

end

local function drawParticle(self)

    local z = self:GetParent():GetZ() + self:GetZ()


    local percent = z - min             percent = percent / depthLength             percent = 1 - percent
    
    local color = lerp_color( percent, colors[1], colors[2] )           self:diffuse(color)


    local alpha = alpha(z)              alpha = math.max( 0, alpha )            alpha = math.min( 1, alpha )

    self:diffusealpha(alpha)

    
    self:Draw()

end

local function children(self)

    local children = self:GetChild("")          if #children == 0 then children = { children } end

    return children

end

local function draw(self)

    if not self.canDraw then return end

    local children = children(self)         for k,v in pairs(children) do drawParticle(v) end

end


local sleep, depth

local function ActorFrame(i)

    return Frame {

        OnCommand=function(self) self:SetDrawFunction(draw):zbuffer(true):queuecommand("Post") end,

        PostCommand=function(self)

            sleep = self.Sleep or 1             depth = self.Depth or 0

            if Reversed then depth = - depth end


            local rate = self:tweenRate() * 2
            
            local i = i - 1         i = i * sleep         i = rate * i / n

            self:queuecommand("Prepare"):sleep(i):queuecommand("Motion"):queuecommand("Draw")

        end,

        DrawCommand=function(self) self.canDraw = true end,

        PrepareCommand=function(self) local z = z[2] + depth         self:z(z) end,

        MotionCommand=function(self)
            
            local rate = self:tweenRate()       local z = z[1] - depth
            
            self:linear(rate):z(z)          self:queuecommand("Prepare"):queuecommand("Motion")

        end

    }

end

local function Particle( i, state )

    state = state or i

    return beat4sprite.Sprite {

        Texture = Texture,
        
        OnCommand=function(self) self.Index = i         self:initParticle( builder, state ) end

    } .. Sprite

end

return MainFrame, ActorFrame, Particle