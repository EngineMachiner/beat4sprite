
local ScaleVar = _screen.h/480

    local Backgrounds = {

    	GAMESTATE:GetCurrentSong():GetBackgroundPath(),
    	"/BGAnimations/Backgrounds/5th/64 (stretch).png",
   		"/BGAnimations/Backgrounds/5th/27 (stretch).png",
    	"/BGAnimations/Backgrounds/5th/8 (stretch).png",

    }

local t = Def.ActorFrame{

    LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end

}

	-- Script

	t[#t+1] = LoadActor("../Scripts/SplitScreen", Backgrounds, true, 1 )..{}

return t