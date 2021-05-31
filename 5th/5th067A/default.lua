
local replace = ...

local s = "/BGAnimations/Resources"
local params = {

	{ 
		Index = 2, 
		File = s .. "/5th/Backgrounds/CA.png",
		Cleanup = true,
		Frame_i = 1,
		Commands = "Mirror",
		BGMirror = true,
		X_num = 1
	},

	{
		Index = 1, 
		File = s .. "/5th/Sprites/CA 4x3.png",
		Frame_i = 8,
		Cleanup = true,
		X_num = { -4, 3 },
		Y_num = 1,
		Commands = "SpinY"
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th051A/default.lua" )( params )
}