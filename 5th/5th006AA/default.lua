
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		Cleanup = true,
		File = "/BGAnimations/Resources/5th/Sprites/DABCD 1x4.png",
		Frame_l = 4,
		X_num = 1,
		Y_num = { -3, 4 },
		Y_coord = -1,
		FrmDelay = 2,
		Commands = { "StairsStates", "Move" }
	},

	{
		Index = 2,
		Remove = true
	}
	
}
	
	BGA_G.ParTweak( tweaks, replace )
	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )

return Def.ActorFrame{ t }