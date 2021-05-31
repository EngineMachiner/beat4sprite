
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {
	File = "/BGAnimations/Resources/1st/Backgrounds/A.png",
	X_num = 1,
	Commands = "Color",
	Color = color("#f80060")
} 

	t[#t+1] = loadfile("/BGAnimations/1st006/default.lua")()
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }