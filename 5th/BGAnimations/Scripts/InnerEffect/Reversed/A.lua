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
        self:fov(120*ScaleVar)
    end
 
}

k = Def.ActorFrame{}

t[1] = k

for i=-math.random(0,2),math.random(0,2) do

    k[-i+3] = Def.Sprite{
        Texture=tool_sprite,
        OnCommand=cmd(z,ScaleVar*(i+5)*-50),
        GainFocusCommand=function(self)

            if rotationz_allow then
                self:spin()
            end

            if rotationx_allow then
                self:rotationx(90):zoom(ScaleVar/4)
                self:zoom( self:GetZoom() * 3 )
            end

            self:xy( SCREEN_CENTER_X+self:GetWidth()*ScaleVar*i, SCREEN_CENTER_Y+self:GetHeight()*ScaleVar*i )
            
        end

    }

end

return t