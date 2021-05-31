
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 13,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "NoAnimation"
}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile( "/BGAnimations/Resources/Scripts/WallBumps.lua" )( params_2 )

}