
local tweaks = ...
local s = "/BGAnimations/Resources"

local params = {
	Index = 1,
	File = s .. "/5th/Backgrounds/BABC 2x2.png",
	Frame_i = 1,
	X_num = { -2, 1 },
	Y_num = { -1, 0 }
}

	BGA_G.ParTweak( params, tweaks )

local params_2 = {
	Index = 2,
	File = s .. "/5th/Sprites/BAB 4x4.png",
	Frame_i = 9,
	Dir = "Right",
	Script = s .. "/Scripts/Particles.lua"
}

	BGA_G.ParTweak( params_2, tweaks )

return Def.ActorFrame{
	loadfile( s .. "/Scripts/TileTool.lua" )( params ),
	loadfile( params_2.Script )( params_2 )
}