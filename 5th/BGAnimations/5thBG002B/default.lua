
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

	LoadActor( "../Scripts/BGExtender", tbl.file )..{},

	LoadActor("B.lua")..{
		OnCommand=function(self)
			self:diffusealpha(0.25)
		end
	},
	
	LoadActor("../Scripts/WallBumpEffect1stCycle/default.lua", "/BGAnimations/Sprites/5th/2 Sun 2x1.png", ScaleVar)..{}

}