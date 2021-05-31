
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 3 },
		Y_num = 2,
		Frame_i = 13,
		Commands = "Move",
		Y_coord = -1,
		HurryTweenBy = 2,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2,
	Dir = "Down"
}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params ),
	loadfile( "/BGAnimations/Resources/Scripts/Particles.lua" )( params_2 )

}