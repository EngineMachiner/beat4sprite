
local Vector = Astro.Vector


local builder = ...             builder.Sides = 6

builder.Scroll = builder.Scroll or Vector("UpRight")          builder.Zoom = 0.25

if tapLua.shadersEnabled() then
    
    builder.Tiles = 3       builder.Zoom = 0.5          return beat4sprite.Load( "Kaleidoscope/Shader" )( builder )

end


local isLegacy = tapLua.isLegacy()

local Polygon, Texture = beat4sprite.Load("Kaleidoscope/Polygon")( builder )

local scale = SCREEN_HEIGHT / 720           local screenSize = tapLua.screenSize()

local Path = beat4sprite.Path .. "Scripts/Tile/Tile.lua"

return beat4sprite.ActorFrame {
    
    tapLua.ActorFrameTexture {

        Polygon .. { InitCommand=function(self) Polygon = self end },

        OnCommand=function(self)

            if Texture then return end

            self:setSizeVector(screenSize):EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

            Texture = self:GetTexture()         self:GetParent():queuecommand("Legacy"):queuecommand("TilePolygon")

        end
        
    },

    tapLua.ActorFrameTexture {

        -- Legacy workaround stretching to power of two size. Taken from Tile.lua

        Condition = isLegacy,

        tapLua.Sprite {
            
            LegacyCommand=function(self)
                
                local size = tapLua.Texture.size(Texture)           Polygon:addx(-108) -- Hacky.

                self:SetTexture(Texture):setPos( size / 2 ):setSizeVector(size):SetTextureFiltering(false)


                local AFT = self:GetParent()              AFT:setSizeVector(size)

                AFT:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

                Texture = AFT:GetTexture()

            end
        
        }

    },

    beat4sprite.ActorFrame {

        TilePolygonCommand=function(self)

            self:init(builder)

            local Sprite = {
                    
                OnCommand=function(self)
                    
                    if not isLegacy then return end         self:zoomy( self:GetZoomY() * 1.5 )
                
                end
            
            }

            beat4sprite.Arguments = beat4sprite.Builder {
                
                Texture = Texture,        Zoom = 0.375 / scale,       Filter = false,       Sprite = Sprite
            
            }

            self:AddChildFromPath(Path)         beat4sprite.Arguments = nil         self:queuecommand("On")

        end

    }

}