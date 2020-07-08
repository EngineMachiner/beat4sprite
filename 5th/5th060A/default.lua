
local replace = ...

local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 12,
	X_num = { -4, 3 },
	Y_num = 1
}

local params_2 = {
	Index = 2,
	File = "/BGAnimations/Resources/5th/Sprites/B 4x3.png",
	Frame_i = 1,
	Frame_l = 6,
	Dir = "Left",
	Script = "../Resources/5th/Scripts/Particles.lua"
}

	BGA_ParamsTweaks( params, replace )
	BGA_ParamsTweaks( params_2, replace )

return Def.ActorFrame{

	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{},
	LoadActor( params_2.Script, params_2 )..{}

}