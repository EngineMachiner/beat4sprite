
local replace = ...
local params = {

	Index = 1,
	Commands = ""

}

local params_2 = {

	Index = 1,
	File ="/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	X_num = { -4, 3 },
	Y_num = 2,
	HurryTweenBy = 1.5,
	Commands = "Move",
	Y_coord = -1,
	Frame_i = 1,
	Frame_l = 2

}

	BGA_G.ParTweak(params_2,replace)

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th014A",params)..{},
	LoadActor("../Resources/Scripts/TileTool.lua",params_2)..{}

}