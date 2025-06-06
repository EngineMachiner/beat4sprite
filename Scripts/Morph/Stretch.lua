
-- This effect is an example of clock inaccuracy?

local Vector = Astro.Vector             local planeAxes = Vector.planeAxes


local builder = ...             local Texture = builder.Texture             local Type = builder.Type or 2


local directions = { Vector(1), Vector { y = 1 } }              local direction = directions[Type]


local subTexture, scroll, pos

return tapLua.ActorFrame {

    OnCommand=function(self) self:Center() end,

    beat4sprite.ScreenQuad() .. {

        OnCommand=function(self)
            
            pos = - tapLua.screenSize()           for i,v in ipairs(planeAxes) do pos[v] = pos[v] * direction[v] end

            self:init(builder):MaskSource(true):setPos(pos):queuecommand("Cycle")

        end,

        CycleCommand=function(self)

            local t = self:periodRate() * 4

            self:linear(t):xy( 0, 0 ):queuecommand("Prepare")
            
            self:linear(t):setPos(pos):queuecommand("Prepare"):queuecommand("Cycle")

        end,

        PrepareCommand=function(self) self:GetParent():queuecommand("Reverse") end
    
    },

    tapLua.ActorFrameTexture {

        OnCommand=function(self) 
            
            self:setSizeVector( tapLua.screenSize() )

            self:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

            subTexture = self:GetTexture()
        
        end,

        beat4sprite.Builder.Background(Texture):Load()

    },

    beat4sprite.Sprite {

        OnCommand=function(self)
            
            self:SetTexture(subTexture):invertedMaskDest()             self:init(builder):initSprite()

            local rectangle = Vector( 1, 1 ) - direction                self:customtexturerect( 0, 0, rectangle:unpack() )

            scroll = direction * 0.25 / self:periodRate()               self:texcoordvelocity( scroll:unpack() )
        
        end,

        ReverseCommand=function(self)

            scroll = - scroll               self:texcoordvelocity( scroll:unpack() )

        end

    }

}