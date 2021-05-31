local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/BA.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true,
		Cleanup = true	
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
		Frame_i = 3,
		Frame_l = 4,
		X_num = { -2, 1 },
		Y_num = { -2, 1 },
		Commands = { "StairsStates", "SpinY" },
		Cleanup = true		
	},

	{
		Index = 2,
		Remove = true
	}

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile( "/BGAnimations/5th001A/default.lua" )( params_2 )

}