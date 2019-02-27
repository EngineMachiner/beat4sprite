local ScaleVar, file, Reversed = ...

local t = Def.ActorFrame{
    
    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

}

local tbl = {}

for i=3,0,-1 do

    t[#t+1] = LoadActor("1.lua", ScaleVar, file, Reversed, i )..{}

end

return t