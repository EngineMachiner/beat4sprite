
local replace = ...

local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 14,
		Frame_l = 15,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( tweaks, replace )

	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )

return Def.ActorFrame{ t }