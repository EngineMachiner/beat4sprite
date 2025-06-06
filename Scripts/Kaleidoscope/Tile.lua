
local Vector = Astro.Vector


local builder = ...             builder.Sides = 6               builder.Scroll = builder.Scroll or Vector( 1, -1 )

builder.Zoom = 0.25


local Hexagon           local offsetX = 16.5

local function proxy( f )
    
    return Def.ActorProxy { OnCommand=function(self) self:SetTarget(Hexagon) f(self) end }

end

local t = tapLua.ActorFrame {

    beat4sprite.Load( "Kaleidoscope/Polygon" )( builder ) .. {
        
        OnCommand=function(self) Hexagon = self         self:x(0):CenterY():zoom(1) end

    },

    Def.ActorFrame {

        OnCommand=function(self) self:x( - offsetX ) end,

        proxy( function(self) self:x( SCREEN_WIDTH - offsetX ) end ),

        proxy( function(self) self:CenterX():y( - SCREEN_CENTER_Y ) end ),

        proxy( function(self) self:CenterX():y( SCREEN_CENTER_Y ) end )

    }

}


local Texture           local Hexagons = t .. { OnCommand=function(self) self:x( - offsetX ) end }

local Path = beat4sprite.Path .. "Scripts/Tile/Tile.lua"

return tapLua.ActorFrame {
    
    tapLua.ActorFrameTexture {

        OnCommand=function(self)

            local size = tapLua.screenSize() - Vector( offsetX * 2 )

            self:setSizeVector(size):EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()

            Texture = self:GetTexture()         self:GetParent():queuecommand("LoadHexagon")
        
        end,    Hexagons
        
    },

    tapLua.ActorFrame {

        LoadHexagonCommand=function(self)

            beat4sprite.Arguments = beat4sprite.Builder { Texture = Texture,        Zoom = 0.375 }

            self:AddChildFromPath(Path)         beat4sprite.Arguments = nil         self:queuecommand("On")

        end

    }

}