
local tbl = {}

if GAMESTATE:GetCurrentSong():HasBackground() then 
	tbl.file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
else 
	tbl.file = "/BGAnimations/Backgrounds/fallback.png"
end

local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	OnCommand=function(self)
		self:rainbow():effectperiod(8):effectclock('beat')
	end,

	LoadActor( "../Scripts/BGExtender", tbl.file )..{},

	LoadActor("B.lua")..{
		OnCommand=function(self)
			self:diffusealpha(0.25)
		end
	}
	
}