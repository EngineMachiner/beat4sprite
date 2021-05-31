
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 10,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 1

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile("/BGAnimations/Resources/Scripts/SpaceEffects/Spiral.lua" )( params_2 )

}