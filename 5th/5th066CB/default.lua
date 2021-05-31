
local replace = ...

local s = "/BGAnimations/Resources"
local params = {

	{
		Index = 1,
		File = s .. "/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 8
	},

	{
		Index = 2,
		File = s .. "/5th/Sprites/CAB 5x4.png",
		Frame_i = 1,
		Spin = true
	}

}

BGA_G.ParTweak( params, replace )

s = s .. "/Scripts"
return Def.ActorFrame{
	loadfile( s .. "/TileTool.lua" )( params[1] ),
	loadfile( s .. "/SpaceEffects/Stairs.lua" )( params[2] )
}