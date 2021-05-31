
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 16,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 11,
	Frame_l = 12,
	Commands = "TwoSprites",
	Script = "/BGAnimations/Resources/Scripts/LineXY.lua"
	
}

	BGA_G.ParTweak(params_2,replace)

local t = Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile( params_2.Script )( params_2 )

}

return Def.ActorFrame{ t }