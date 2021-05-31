
local replace = ...

local s = "/BGAnimations/Resources"
local params = {

	{
		Index = 1,
		File = s .. "/5th/Backgrounds/BABC 2x2.png",
		Frame_i = 3,
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Commands = "Mirror",
		Cleanup = true
	},

	{
		Index = 3,
		Script = s .. "/Scripts/SpaceEffects/Stairs.lua",
		File = s .. "/5th/Sprites/B 4x3.png",
		Frame_i = 1,
		Frame_l = 5
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th005/default.lua" )( params )
}