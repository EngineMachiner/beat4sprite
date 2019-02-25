local ScaleVar, file, Reversed = ...

local t = Def.ActorFrame{
    
    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

}

for i=3,0,-1 do

local ScaleVar_2 = (ScaleVar*(i*0.5))
    if ScaleVar_2 == 0 then ScaleVar_2 = 0.25 mirror = -1 textcoordsense = -1 end
    if ScaleVar_2 == 1.5 then ScaleVar_2 = 2 end
    if i == 1 then mirror = 2 textcoordsense = 1 end
    if i == 2 then mirror = -4 textcoordsense = -1 end
    if i == 3 then  mirror = 8 textcoordsense = 1 end

    t[#t+1] = LoadActor("1.lua", ScaleVar, file, Reversed, mirror, textcoordsense)..{
                OnCommand=function(self)
                --if i == 2 then self:diffuse(color("#ff0000")):diffusealpha(0.5) else self:diffuse(color("#00ff38")) end
                self:zoom(ScaleVar_2)
                self:xy(SCREEN_WIDTH*(1/2)*(-ScaleVar_2+1), SCREEN_HEIGHT*(1/2)*(-ScaleVar_2+1))
            end
        }

    t[#t+1] = LoadActor("1.lua", ScaleVar, file, Reversed, mirror, textcoordsense)..{
            OnCommand=function(self)
                --if i == 2 then self:diffuse(color("#ff0000")):diffusealpha(0.5) else self:diffuse(color("#00ff38")) end
                self:rotationz(180)
                self:zoom(ScaleVar_2)
                self:xy( SCREEN_WIDTH*(1/2)*(-ScaleVar_2+1)+SCREEN_WIDTH*ScaleVar_2, SCREEN_HEIGHT*(1/2)*(-ScaleVar_2+1)+SCREEN_HEIGHT*ScaleVar_2 )
            end 
        }

end

return t