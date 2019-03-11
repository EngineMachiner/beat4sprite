local tool_sprite, tool_delay, ScaleVar, RState, rotationz_allow, rotationx_allow = ...

local t = Def.ActorFrame{
 
    OnCommand=function(self)
        local random_states if RState == true then
            self:RunCommandsOnChildren( function(child) child:setstate(math.random(0,child:GetNumStates()-1)) end )
        end
        self:SortByDrawOrder():fov(90*1.5)
    end
 
}

    for i = 1,16 do
        t[#t+1] = LoadActor("A.lua", tool_sprite, rotationz_allow, rotationx_allow)..{
            GainFocusCommand=function(self)
                self:xy(math.random(-SCREEN_WIDTH*ScaleVar/3,SCREEN_WIDTH*ScaleVar/3),math.random(-SCREEN_HEIGHT*ScaleVar/3,SCREEN_HEIGHT*ScaleVar/3))
                :diffusealpha(0):diffuse(color("0,0,0,255/9")):z(-1000*ScaleVar):sleep( ( i - 1 ) * 2 ):diffusealpha(1)
                :linear( 6 + 1 )
                :z(125*ScaleVar/3)
                :diffuse(Color.White)
                :linear(0.5)
                :diffusealpha(0)
                :effectclock("beat")
                :set_tween_uses_effect_delta(true)
                :queuecommand("Repeat")
            end,
            RepeatCommand=function(self)
                if i == 16 then
                    self:sleep( 8 )
                end
                self:sleep( 4 )
                :xy(math.random(-SCREEN_WIDTH*ScaleVar/3,SCREEN_WIDTH*ScaleVar/3),math.random(-SCREEN_HEIGHT*ScaleVar/3,SCREEN_HEIGHT*ScaleVar/3))
                :diffusealpha(1):diffuse(color("0,0,0,255/9")):z(-1000*ScaleVar)
                :linear( 6 + 1 )
                :z(125*ScaleVar/3)
                :diffuse(Color.White)
                :linear(0.5)
                :diffusealpha(0)
                :effectclock("beat")
                :set_tween_uses_effect_delta(true)
                :queuecommand("Repeat")
            end
        }
    end

return t