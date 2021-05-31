
local params = {

	{
		Index = 1,
		Cleanup = true,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		Frame_i = 15,
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Commands = { "RandomDelays" }
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {}

	DeepCopy(params,params_2)
	params_2[1]["File"] = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png"
	params_2[1]["Frame_i"] = 5
	params_2[1]["Frame_l"] = 8

return Def.ActorFrame{
	
	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile("/BGAnimations/5th001A/default.lua" )( params_2 )

}