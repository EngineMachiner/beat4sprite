
local builder = beat4sprite.Arguments

local Sprite = builder.Sprite                   local OnCommand = Sprite and Sprite.OnCommand

local Matrix = builder.Matrix                   local Texture = builder.Texture

local States = tapLua.Load( "Sprite/Crop", "States" )(Matrix)

builder = builder:merge {
    
    Dynamic = true,     States = { Matrix = Matrix },
    
    Texture = builder.Target,       Script = "Tile/Tile",

    Sprite = {
        
        OnCommand=function(self)

            local size = self:GetSize()

            self:Load(Texture):animate(false):setSizeVector(size)
            
            self:SetStateProperties(States):setstate( self.Index - 1 )

            
            local States = self:scrollStates()
            
            if States then self:SetStateProperties(States) end          if OnCommand then OnCommand(self) end

        end
    
    }

}

builder.Scale = SCREEN_HEIGHT * 3 / 720

return builder:Load() .. { InitCommand=function(self) self:queuecommand("On") end }