
local replace = ...

local params = {

	Index = 1,
	Frame_l = 11,
	Commands = ""

}

local params_2 = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Delay = 2,
	Commands = { "SpinXY" }

}

	BGA_ParamsTweaks( params, replace )
	
return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th031A", params )..{},
	LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params_2 )..{}

}