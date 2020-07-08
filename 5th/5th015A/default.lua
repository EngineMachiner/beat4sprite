
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/BABCD 4x1.png",
		Frame_i = 1,
		Frame_l = 4,
		ResetParams = true,
		Commands = "StairsStates",
		X_num = { -4, 3 },
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/B 4x3.png",
	Frame_i = 1,
	Frame_l = 6,
	Dir = "Down"

}

	BGA_ParamsTweaks( params_2, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("../Resources/5th/Scripts/Particles.lua",params_2)..{},

}