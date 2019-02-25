BGA_SongLimit_Corners = math.floor(GAMESTATE:GetCurrentSong():GetLastSecond()*0.7)
local tool_sprite = "/BGAnimations/Sprites/1 5x1.png"
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Backgrounds/Tool.lua", tool_sprite, 1/5, ScaleVar, false )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75); },

	LoadActor("../ParticleEffects/InnerEffect", "/BGAnimations/Sprites/head.png", 0, ScaleVar, false, true)..{};

};

return t