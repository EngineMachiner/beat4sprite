local replace = ...
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 10,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CA 4x3.png",
	Frame_i = 7,
	Dir = "Out",
	Flat = true

}

	BGA_ParamsTweaks(params_2, replace)

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("../Resources/Scripts/5th/Z_Effects/Stairs.lua",params_2)..{}

}