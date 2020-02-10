local tool_sprite, RState, rotationz_allow, rotationx_allow = ...

local t = Def.ActorFrame{}

for i=0,2 do

    t[#t+1] = LoadActor( "A.lua", tool_sprite, RState, rotationz_allow, rotationx_allow, i )..{

    OnCommand=function(self)
        self:diffusealpha(0):sleep(i*2):diffusealpha(1):zbuffer(true):queuecommand("Next")
        self:set_tween_uses_effect_delta(true):effectclock('beat')
        ToolPreview(self)
    end,

    NextCommand=function(self)
        self:z(200):linear(4):z(-1000):queuecommand("Next")
    end

    }

end

return t