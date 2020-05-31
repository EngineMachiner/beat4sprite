
local t = Def.ActorFrame{}

local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 5,
		Frame_l = 6,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}
	
	BGA_ParamsTweaks( params, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", params )..{}


	params = {

		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/B 4x3.png",
		Frame_i = 1,
		Frame_l = 6,
		Script = "/BGAnimations/Resources/Scripts/WallBumps.lua"

	}

	BGA_ParamsTweaks( params, replace )

	t[#t+1] = LoadActor( params.Script, params )..{}


return Def.ActorFrame{ t }