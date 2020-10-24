
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 13,
		Commands = { "Move" },
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}
	

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frame_i = 9

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params_2, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("../Resources/Scripts/5th/WallBumps.lua",params_2)..{}

}