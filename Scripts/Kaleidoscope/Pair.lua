
local Actor

return tapLua.ActorFrame {

    beat4sprite.Load( "Kaleidoscope/Triangle" )(...) .. {

        PostInitCommand=function(self)
            
            Actor = self       self:GetParent():GetParent():queuecommand("SetTarget")

            local size = self:GetSize()           self:setPos( size * 0.5 )

            self:GetParent():setSizeVector(size)
        
        end

    },

    Def.ActorProxy {

        SetTargetCommand=function(self) self:SetTarget(Actor):zoomx(-1) end

    }
    
}