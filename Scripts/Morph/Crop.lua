
local crops = {

    -- The returned value can be set for both horizontally or vertically and it's cropped centered based on the layer.

    Centered = function( i, layers )
    
        -- Multiplied by 2 because it's the cropping on both sides.
    
        local n = layers + 1        n = n * 2       return i / n
    
    end,

    
    -- Returns the values in an array depending on the axis crop value. The cropping looks like slices across.
    
    Sliced = function( step, fade )
        
        return function(value)

            local v = value             if v == 0 then return { 0, 0 } end

            return { v - step - fade * 2,      1 - v - 0.016 }

        end

    end

}

return crops[...]