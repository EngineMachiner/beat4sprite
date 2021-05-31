
local replace = ...

local t = Def.ActorFrame{}

local tweaks = {

	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 7,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( tweaks, replace )
	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 3,
	Spin = true,
	Script = "/BGAnimations/Resources/Scripts/SpaceEffects/Stairs.lua"

}

	BGA_G.ParTweak( params_2, replace )
	t[#t+1] = loadfile( params_2.Script )( params_2 )

return Def.ActorFrame{ t }