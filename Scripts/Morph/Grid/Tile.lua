
local builder = beat4sprite.Arguments           local Builder = beat4sprite.Builder

local Sprite = builder.Sprite                   local OnCommand = Sprite and Sprite.OnCommand

local Matrix = builder.Matrix                   local Texture = builder.Texture

local States = tapLua.Load( "Sprite/Crop", "States" )(Matrix)

builder = builder:merge {
    
    Dynamic = true,     States = { Matrix = Matrix },
    
    Texture = builder.Target,       Script = "Tile/Tile",

    Sprite = {
        
        OnCommand=function(self)

            local size = self:GetSize()

            self:LoadBy(Texture):animate(false):setSizeVector(size)
            
            self:setStateProperties(States):setstate( self.Index - 1 )

            
            local States = self:scrollStates()
            
            if States then self:setStateProperties(States) end          if OnCommand then OnCommand(self) end

        end
    
    }

}

return Builder.Load(builder) .. { InitCommand=function(self) self:queuecommand("On") end }