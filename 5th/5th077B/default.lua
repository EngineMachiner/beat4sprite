
local replace = ...

local s = "/BGAnimations/Resources"
local params = {

	{
		Index = 1,
		File = s .. "/5th/Sprites/A 4x3.png",
		Frame_i = 7,
		Frame_l = 8,
		X_num = { -4, 3 },
		Y_num = 1,
		Delay = 0.5,
		Speed = 2
	},

	{
		Index = 2,
		File = s .. "/5th/Sprites/AB 4x4.png",
		Frame_i = 1,
		Frame_l = 2,
		X_num = 4,
		X_pos = 1,
		Y_num = 2,
		X_coord = -1,
		Y_coord = -1,
		Commands = "Move",
		Delay = 0.5,
		Speed = 2
	}

}

BGA_G.ParTweak( params, replace )

s = s .. "/Scripts/TileTool.lua"
return Def.ActorFrame{
	loadfile( s )( params[1] ),
	loadfile( s )( params[2] )
}