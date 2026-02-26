
local path = beat4sprite.Path .. "Scripts/Morph/Grid/Tile.lua"

local Vector = Astro.Vector         local componentDivision = Vector.componentDivision

local builder = ...                 local Matrix = builder.Matrix or Vector( 8, 6 )

return beat4sprite.ActorFrame {

    tapLua.ActorFrameTexture {

        tapLua.Sprite {
            
            OnCommand=function(self)

                local p = self:GetParent()
                
                local size = Vector(320, 240)           size = componentDivision( size, Matrix )

                self:setPos( size / 2 )                 self:setSizeVector(size)       p:setSizeVector(size)
                
                p:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()


                beat4sprite.Arguments = builder:merge { Target = p:GetTexture(),        Matrix = Matrix }
                
                p:GetParent():AddChildFromPath(path)        beat4sprite.Arguments = nil

            end

        }

    }
    
}