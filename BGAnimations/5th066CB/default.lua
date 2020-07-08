
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 8
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 1,
		Spin = true
	}

}

	BGA_ParamsTweaks( tweaks, replace )

return Def.ActorFrame{

	LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params[1] )..{},
	LoadActor( "/BGAnimations/Resources/5th/Scripts/Z_Effects/Stairs.lua", params[2] )..{}

}