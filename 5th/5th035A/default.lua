
local replace = ...

local t = Def.ActorFrame{}
local s = "/BGAnimations/Resources"

local tweaks = {

	{ 
		Index = 1,
		File = s .. "/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 5 },
		Y_num = 2,
		Frame_i = 15,
		X_coord = -1,
		Y_coord = -1,
		Commands = "Move",
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}
	
	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )

local params_2 = {}

	DeepCopy(tweaks, params_2)
	params_2[1]["Fade"] = { 1, 0 }
	params_2[1]["Class"] = "Quad"
	params_2[1]["Color"] = "Rainbow"
	params_2[1]["Commands"] = { "Move", "Fade", "Blend" }

	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( params_2 )

local params_3 = {

	Index = 3,
	ID = 3,
	File = s .. "/5th/Sprites/DABC 4x4.png",
	Frame_i = 11,
	Frame_l = 12,
	Dir = "Down",
	Spin = true,
	Shade = true,
	Commands = "TwoSprites"

}

	BGA_G.ParTweak( params_3, replace )

	t[#t+1] = loadfile( s .. "/Scripts/Particles.lua" )( params_3 )

return Def.ActorFrame{ t }