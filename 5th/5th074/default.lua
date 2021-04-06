
local replace = ...

local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12,
	Commands = { "Move", "Cross", "StairsStates" },
	X_pos = 1,
	X_num = 6,
	Y_num = 1,
	X_coord = 1,
	StopAtFrame = 2,
	HurryTweenBy = 2
}

local params_2 = {}
DeepCopy(params, params_2)
params_2["Index"] = 2
params_2["File"] = "/BGAnimations/Resources/5th/Sprites/HSV/DABCDE 4x3.png"
params_2["X_pos"] = 0

	BGA_G.ParTweak(params, replace)
	BGA_G.ParTweak(params_2, replace)

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{},
	LoadActor( "../Resources/Scripts/TileTool.lua", params_2 )..{}
}