
local params = {
	File = "BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
	Frame_i = 7,
	Frame_l = 8,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Commands = "LineStates"
}

local params_2 = {
	File = "BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
	Frame_i = 9,
	Backwards = true
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{},
	LoadActor( "../Resources/Scripts/SpiralStaticTrace", params_2 )..{}
}