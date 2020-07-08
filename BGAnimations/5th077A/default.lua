
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
		Frame_i = 7,
		Frame_l = 8,
		X_num = { -3, 2 },
		Y_num = 1,
		Delay = 0.25
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		Frame_i = 1,
		Frame_l = 2,
		X_num = 3,
		Y_num = { -2, 1 },
		X_coord = -1,
		Commands = "Move",
		Delay = 0.25
	}

}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params[1] )..{},
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params[2] )..{}
}