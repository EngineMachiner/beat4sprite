
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		ResetParams = true,
		X_num = { -4, 3 },
		Y_num = 1,
	},

	{
		Index = 2,
		Remove = true
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		Frame_i = 10,
		Dir = "Out"
	}

}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("/BGAnimations/Resources/Scripts/5th/Z_Effects/RoundTrace.lua",params[3])..{}

}