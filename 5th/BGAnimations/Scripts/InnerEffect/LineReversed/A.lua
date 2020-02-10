local tool_sprite, RState, rotationz_allow, rotationx_allow = ...
local ScaleVar = _screen.h/480
local t = Def.ActorFrame{

    GainFocusCommand=function(self)

        if RState then
            self:RunCommandsOnChildren( function(child) 
                if child:GetNumStates() > 1 then 
                    child:setstate(math.random(0,child:GetNumStates()))
                end
            end )
        end

        if rotationx_allow then
            self:fov(140)
        else
            self:fov(130)
        end
        
    end
 
}

k = Def.ActorFrame{}

t[1] = k

for i=0,4 do

    k[-i+3] = Def.Sprite{
        Texture=tool_sprite,
        GainFocusCommand=function(self)

            if rotationz_allow then
                self:spin()
            end

            if rotationx_allow then
                self:rotationx(90):zoom(ScaleVar/4)
            end

            self:xy( SCREEN_LEFT+self:GetWidth()*ScaleVar*i*1.5, SCREEN_BOTTOM )
            AnimationDelay(self)
            self:set_tween_uses_effect_delta(true):effectclock('beat')
            ToolPreview(self)
            
        end

    }

end

return t