local tool_sprite, rotationz_allow, rotationx_allow = ...
local ScaleVar = _screen.h/480
local t = Def.ActorFrame{
 
    OnCommand=function(self)
        local random_states if RState == true then
            self:RunCommandsOnChildren( function(child) child:setstate(math.random(0,child:GetNumStates()-1)) end )
            end
        end,
 
}

k = Def.ActorFrame{};

t[1] = k

for i=-math.random(-2,2),math.random(-2,2) do

k[-i+3] = Def.Sprite{
            Texture=tool_sprite,

                        GainFocusCommand=function(self)

                        if rotationz_allow == true then
                            for m=1,50 do
                                self:spin():effectoffset(m/1.25)
                            end
                        end

                        if rotationx_allow == true then
                                self:rotationx(90):zoom(ScaleVar/4)
                        end
                        
                        self:draworder(-(i-3))
                        self:z(i*-100*ScaleVar)
                        self:zoom(ScaleVar)
                        self:xy(SCREEN_CENTER_X+self:GetWidth()*ScaleVar*i,SCREEN_CENTER_Y+self:GetHeight()*ScaleVar*i)
                        end,

                    };

end

k.OnCommand=function(self)
    self:SortByDrawOrder()
end

return t