local replace = ...

local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
	Frame_i = 14,
	X_num = { -4, 3 },
	Y_num = { -2, 1 }
}

local params_2 = {	Index = 1 }

	DeepCopy( params, params_2 )

	params_2["File"] = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png"
	params_2["Frame_i"] = 10
	params_2["Y_num"] = { -2, 1 }
	params_2["Speed"] = 2
	params_2["Commands"] = "SpinXY"

	BGA_ParamsTweaks( params_2, replace )


return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params )..{},
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params_2 )..{}
}