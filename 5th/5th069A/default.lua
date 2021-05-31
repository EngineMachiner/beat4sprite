
local replace = ...

local tweaks = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 16,
		Frame_l = 20,
		Cleanup = true,
		X_num = 5,
		Y_num = { -2, 1 }
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( tweaks, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )
}