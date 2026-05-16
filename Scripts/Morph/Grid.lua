
local merge = tapLua.deepMerge          local isFunction = Astro.Type.isFunction

local Vector = Astro.Vector             local componentDivision = Vector.componentDivision

local Renderer = tapLua.Sprite.Renderer         local Matrix = Vector( 8, 6 )

local properties = tapLua.Load( "Sprite/Crop", "States" )

local function size() return Renderer:GetSize() end

local input = {
    
    Dynamic = true,     Matrix = Matrix,
    
    States = { Matrix = Matrix,     Rate = 0.25,    Position = true }

}

input = merge( input, ... )         input.Script = nil

local Sprite = {

    InitCommand=function(self)
        
        if self.Index > 1 then return end           Matrix = input.Matrix

        local size = componentDivision( size(), Matrix )        Renderer:setSizeVector(size)
    
    end,

    OnCommand=function(self)

        self:setSizeVector( size() ):queuecommand("PostInit")

        local p = properties(Matrix)        self:SetStateProperties(p)

        p = self:scrollStates()             self:SetStateProperties(p)
    
    end

}

merge = tapLua.Actor.merge         input.Sprite = merge( Sprite, input.Sprite )

return input