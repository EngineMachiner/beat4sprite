local tool_sprite, tool_delay, ScaleVar, RState, rotationz_allow, rotationx_allow = ...
BGA_SongLimit_IE = math.floor(GAMESTATE:GetCurrentSong():GetLastSecond()/(19/60))
local t = Def.ActorFrame{
 
    OnCommand=function(self)
        local random_states if RState == true then
            self:RunCommandsOnChildren( function(child) child:setstate(math.random(0,child:GetNumStates()-1)) end )
            end
        end,
 
}

a = Def.ActorFrame{};

t[1] = a

for m=0,BGA_SongLimit_IE do

            a[10+m]  =  LoadActor("TestStair", tool_sprite, rotationz_allow, rotationx_allow)..{
                        GainFocusCommand=function(self)
                        self:finishtweening():sleep(0.01):diffusealpha(0):xy(math.random(-SCREEN_WIDTH*ScaleVar/3,SCREEN_WIDTH*ScaleVar/3),math.random(-SCREEN_HEIGHT*ScaleVar/3,SCREEN_HEIGHT*ScaleVar/3))
                        :sleep(m):diffuse(Color.White):diffusealpha(1):z(125*ScaleVar/3)
                        :linear(9)
                        :z(-1000*2*ScaleVar)
                        :diffuse(color("0,0,0,255/9"))
                        :linear(0.25)
                        :diffusealpha(0)
                        :effectclock("beat")
                        :set_tween_uses_effect_delta(true)
                        end,
                    }

end



a.OnCommand=function(self) 
    self:SortByDrawOrder()
    :fov(90*1.5)
end

return t