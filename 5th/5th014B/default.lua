
local params = {

	Index = 1,
	Frame_i = 7,
	Frame_l = 8,
	Commands = "Move",
	SleepMove = true,
	X_coord = -1,
	Y_coord = -1,
	X_num = { -4, 5 },
	Y_num = { -1, 2 }

}

local params_2 = {

	File ="/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th014AB/default.lua" )( params ),
	loadfile( "/BGAnimations/Resources/Scripts/SpaceEffects/RoundTrace.lua" )( params_2 )

}