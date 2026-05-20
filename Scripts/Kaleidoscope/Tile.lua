
local Vector = Astro.Vector


local builder = ...             builder.Sides = 6

builder.Scroll = builder.Scroll or Vector("UpRight")          builder.Zoom = 0.25

if tapLua.shadersEnabled() then
    
    builder.Tiles = 3       builder.Zoom = 0.5          return beat4sprite.Load( "Kaleidoscope/Shader" )( builder )

end


local Texture

local Path = beat4sprite.Path .. "Scripts/Tile/Tile.lua"

return beat4sprite.ActorFrame {
    
    tapLua.ActorFrameTexture {

        beat4sprite.Load("Kaleidoscope/Polygon")(builder),

        OnCommand=function(self)

            if Texture then return end          local size = tapLua.screenSize()

            self:setSizeVector(size):EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

            Texture = self:GetTexture()         self:GetParent():queuecommand("LoadHexagon")
        
        end
        
    },

    beat4sprite.ActorFrame {

        LoadHexagonCommand=function(self)

            self:init(builder)

            beat4sprite.Arguments = beat4sprite.Builder { Texture = Texture,        Zoom = 0.375,       Filter = false }

            self:AddChildFromPath(Path)         beat4sprite.Arguments = nil         self:queuecommand("On")

        end

    }

}