
-- This effect is an example of clock inaccuracy?

local Vector = Astro.Vector             local planeAxes = Vector.planeAxes

local builder = ...                     local Type = builder.Type or 2


local directions = { Vector(1), Vector { y = 1 } }

local direction = directions[Type]


local Texture = builder.Texture

local Background = beat4sprite.Builder.Background(Texture):Load()


local ActorFrameTexture = tapLua.ActorFrameTexture {

    OnCommand=function(self) 
        
        if self:GetTexture() then return end

        self:setSizeVector( tapLua.screenSize() )

        self:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

        Texture = self:GetTexture()
    
    end,

    Background

}

if tapLua.shadersEnabled() then

    builder.Frag = "Shaders/stretch.frag"

    local Shader = beat4sprite.Load( "Morph/Shaders/Load" )( builder ) .. Sprite

    return beat4sprite.ActorFrame {
        
        ActorFrameTexture,

        Shader .. {
            
            OnCommand=function(self)
                
                self:SetTexture( Texture ):fitInScreen()
                
                self:GetShader():uniform1f( "type", Type )
            
            end
        
        }
    
    }

end


local scroll, pos

local Morphing = beat4sprite.ActorFrame {

    OnCommand=function(self) self:Center() end,

    beat4sprite.ScreenQuad() .. {

        OnCommand=function(self)
            
            pos = - tapLua.screenSize()           pos = Vector.componentProduct( pos, direction )

            self:init(builder):MaskSource(true):setPos(pos):queuecommand("Cycle")

            self:SetTextureFiltering(false)

        end,

        CycleCommand=function(self)

            local t = self:periodRate() * 4

            self:linear(t):xy( 0, 0 ):queuecommand("Prepare")
            
            self:linear(t):setPos(pos):queuecommand("Prepare"):queuecommand("Cycle")

        end,

        PrepareCommand=function(self) self:GetParent():queuecommand("Reverse") end
    
    },

    ActorFrameTexture,

    beat4sprite.Sprite {

        OnCommand=function(self)
            
            local hadTexture = self:GetTexture()

            self:SetTexture( Texture ):invertedMaskDest()               self:init(builder):initSprite():setAlpha()

            local rectangle = Vector( 1, 1 ) - direction                self:customtexturerect( 0, 0, rectangle:unpack() )

            scroll = direction * 0.25 / self:periodRate()               if not hadTexture then self:texcoordvelocity( scroll:unpack() ) end
        
            self:SetTextureFiltering(false)

        end,

        ReverseCommand=function(self)

            scroll = - scroll               self:texcoordvelocity( scroll:unpack() )

        end

    }

}

return beat4sprite.ActorFrame { Background,       Morphing }