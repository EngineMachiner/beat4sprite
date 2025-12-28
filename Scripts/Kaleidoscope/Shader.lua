
local builder = ...         local Sides = builder.Sides         local Zoom = builder.Zoom

local Tiles = builder.Tiles or 1


local Path = beat4sprite.Path .. "Scripts"          local Texture

return beat4sprite.ActorFrame {
    
    tapLua.ActorFrameTexture {

        Def.Sprite {

            Texture = builder.Texture,          Frag = Path .. "/Tile/shader.frag",
            
            OnCommand=function(self)
                
                local p = self:GetParent()          local size = tapLua.screenSize()

                self:scale_or_crop_background():SetTextureFiltering(false)
                
                p:setSizeVector(size):EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

                Texture = p:GetTexture()
            
            end

        }    

    },

    beat4sprite.Sprite {

        Frag = Path .. "/Kaleidoscope/shader.frag",

        OnCommand=function(self)

            self:init(builder):SetTexture(Texture):Center():SetTextureFiltering(false)

            local shader = self:GetShader()             local rate = self:tweenRate()
            
            shader:uniform1f( "sides", Sides )          shader:uniform1f( "rate", rate )
            shader:uniform1f( "zoom", Zoom / 2 )        shader:uniform1f( "tiles", Tiles )

        end

    }

}