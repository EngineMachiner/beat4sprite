ENG_BG = "/BGAnimations/Backgrounds/5th/Kaleidoscopes/" .. (...)
local ENG_rule if ENG_BG == "/BGAnimations/Backgrounds/5th/Kaleidoscopes/"..GAMESTATE:GetCurrentSong():GetBackgroundPath() then ENG_BG = GAMESTATE:GetCurrentSong():GetBackgroundPath() end
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("Core2.lua")..{
		OnCommand=cmd(x,160)
	};
	LoadActor("Core2.lua")..{
		OnCommand=cmd(x,-240+12;y,18)
	};
	LoadActor("Core.lua")..{
		OnCommand=cmd(x,640+64+2;y,480-0.25;rotationz,180;addx,160)
	};
}