
-- Since this script returns the builder input use beat4sprite.Load()

local input2 = ...           local merge = tapLua.deepMerge         local isFunction = Astro.Type.isFunction

local y = SCREEN_CENTER_Y / 2           local centerOffset = Astro.Layout.centerOffset

local n = input2.Quantity2

local input = {

    Centered = true,

    Group = { PrepareCommand=function(self) self:xy( 0, y ) end },

    Sprite = {
    
        OnCommand=function(self)
            
            local n = centerOffset(n)                   local x = self.Index - n
            
            x = self:GetZoomedWidth() * x * 1.5         self:xy( x, 0 ):z(0)
        
        end

    }

}

input = merge( input, input2 )          input.Script = "Particles/Depth/Cascade"

return input