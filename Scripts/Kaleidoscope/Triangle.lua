
local Vector = Astro.Vector             local builder = ...         local Texture = builder.Texture

local Sides = builder.Sides             local Scroll = builder.Scroll or Vector(1)


local Angle = 180 / Sides

local Mask = beat4sprite.Path .. "Resources/Global/Masks/Kaleidoscope/" .. "1.png"


local Background = beat4sprite.Builder.Background(Texture)          Background.Scroll = Scroll

local zoom = builder.Zoom * 0.75            Background.Rate = 4 / zoom            Background.Display = Vector( 1, 1 )

Background.Filter = false


local isOffset = math.random(2) == 2

Background.Output = {
    
    LoadSpriteCommand=function(self)

        self:customtexturerect( 0, 0, zoom, zoom )        if not isOffset then return end

        local size = self:GetSize()             self:moveTextureBy( - size * 0.25 )
    
    end

}


local subTexture

return beat4sprite.ActorFrame {

    OnCommand=function(self) self:Center() end,

    beat4sprite.Sprite {

        Texture = Mask,

        OnCommand=function(self)
            
            -- Happy trigonometry =D...

            local angle = math.rad(Angle)                   local w = self:GetHeight() * math.tan(angle)           self:SetWidth(w)

            self:MaskSource(true):scaleToScreen()           self:zoom( self:GetZoom() * 0.5 )--:SetTextureFiltering(false)

            local size = self:GetZoomedSize()               self:GetParent():setSizeVector(size):queuecommand("PostInit")

        end
        
    },

    tapLua.ActorFrameTexture {

        OnCommand=function(self)

            if self:GetTexture() then return end

            local size = tapLua.screenSize()        self:setSizeVector(size)

            self:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

            subTexture = self:GetTexture()
        
        end,

        Background:Load()

    },

    beat4sprite.Sprite {
        
        OnCommand=function(self)

            self:SetTexture(subTexture)             self:init(builder):scaleToScreen():invertedMaskDest()
        
            self:setAlpha():SetTextureFiltering(false)

        end
    
    }

}