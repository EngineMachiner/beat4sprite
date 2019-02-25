ENG_BG = "/BGAnimations/Backgrounds/Kaleidoscopes/" .. (...)
local ScaleVar = _screen.h/480
local ENG_rule if ENG_BG == "/BGAnimations/Backgrounds/Kaleidoscopes/"..GAMESTATE:GetCurrentSong():GetBackgroundPath() then ENG_BG = GAMESTATE:GetCurrentSong():GetBackgroundPath() end
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*119*4;y,ScaleVar*-69*4)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*119*3;y,ScaleVar*-69*3)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*119*2;y,ScaleVar*-69*2)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*119;y,ScaleVar*-69)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd()
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*-119;y,ScaleVar*69)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*-119*2;y,ScaleVar*69*2)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*-119*3;y,ScaleVar*69*3)
	};
		LoadActor("Core.lua")..{
		OnCommand=cmd(x,ScaleVar*-119*4;y,ScaleVar*69*4)
	};
}