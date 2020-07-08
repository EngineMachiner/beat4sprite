
local replace = ...

local params = {

	{
		Index = 1,
		File = "BGAnimations/Resources/5th/Backgrounds/BABC 2x2.png",
		Frame_i = 1,
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Commands = "Mirror",
		ResetParams = true
	},

	{
		Index = 3,
		Script = "../Resources/Scripts/5th/Z_Effects/Stairs.lua",
		File = "BGAnimations/Resources/5th/Sprites/B 4x3.png",
		Frame_i = 1,
		Frame_l = 5
	}

}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{
	LoadActor( "../5th005", params )..{},
}