
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 8,
		Cleanup = true,
		X_num = 5,
		Y_num = { -2, 1 } 
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 1

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile( "/BGAnimations/Resources/Scripts/SpaceEffects/Bounce.lua" )( params_2 )

}