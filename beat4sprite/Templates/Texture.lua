
local params = ...              local p = params

local spin = p.Spin

local textureZoom = p.TextureZoom
if type(textureZoom) == "number" then textureZoom = { x = textureZoom, y = textureZoom } end
textureZoom = textureZoom or { x = 1, y = 1 }

local rotation = p.Rotation

local t = Def.ActorFrame{}

-- Create the texture.
t[#t+1] = Def.ActorFrameTexture {
        
    InitCommand=function(self) 
        self:EnableDepthBuffer(true):EnableAlphaBuffer(true):Create()
        p.Texture = self:GetTexture()
    end,

    beat4sprite.ActorFrame() .. { beat4sprite.Actor(p) .. {

        InitCommand=function(self) self:playcommand("On") end,
        OnCommand=function(self)

            self:init()        local h = self:GetZoomedHeight()

            -- Scale it here and in Sprite.lua.
            local scale = SCREEN_HEIGHT / ( h * p.numberOf.y )
            self:zoom( self:GetZoom() * scale )

            local w = self:GetZoomedWidth() * textureZoom.x
            h = self:GetZoomedHeight() * textureZoom.y

            self:xy( w * 0.5, h * 0.5 )     -- Center it.
            
			if rotation then
				self:rotationx( rotation.x ):rotationy( rotation.y ):rotationz( rotation.z )
			end

            if spin then self:spin():effectmagnitude( 0, 0, 90 * 1.5 ) end

            local m = p.EffectMagnitude
            if m then self:effectmagnitude( m.x, m.y, m.z ) end

            local aft = self:GetParent():GetParent()
            aft:setsize(w, h)

        end

    } }

}

p.Rotation = false

local blend = p.Blend     if blend == true then blend = 'add' end     p.Blend = false
p.hasTexture = true          p.Script = nil

t[#t+1] = p:Load()

-- Blend Texture.
if blend then

    -- Create the texture.
    t = Def.ActorFrame { 
        
        Def.ActorFrameTexture {
        
            InitCommand=function(self)
                self:setsize(SCREEN_WIDTH, SCREEN_HEIGHT)
                self:EnableDepthBuffer(true):EnableAlphaBuffer(true):Create()
                self:GetParent().Texture = self:GetTexture()
            end,

            -- Sandwich.

            beat4sprite.Sprite.blendQuad() .. { OnCommand=function(self) if not p.isInverted then self:diffuse(Color.Black) end end },    
            
            t,

            beat4sprite.Sprite.blendQuad('BlendMode_InvertDest') .. { OnCommand=function(self) if not p.isInverted then self:visible(false) end end }

        },

        Def.Sprite { OnCommand=function(self)
            self:SetTexture( self:GetParent().Texture ):Center():blend( blend or 'add' )
        end }

    }

end

return t