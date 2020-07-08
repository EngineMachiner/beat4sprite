

local replace = ...


local params = {
	Index = 2,
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 11,
	X_num = { -4, 3 },
	Y_num = 1
}

	BGA_ParamsTweaks( params, replace )


local params_2 = {}

	DeepCopy( params, params_2 )
	
	params_2["Index"] = 1
	params_2["File"] = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png"
	params_2["Y_num"] = { -2, 1 }
	params_2["Speed"] = 2
	params_2["Commands"] = "SpinXY"


	BGA_ParamsTweaks( params_2, replace )


return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params )..{},
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params_2 )..{}
}