
local params = {

	Index = 1,
	Delay = 4,
	Commands = ""

}

local params_2 = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Delay = 4,
	SpinC = true,
	Commands = { "SpinXY" }

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th031A/default.lua" )( params ),
	loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params_2 )

}