
local replace = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 2,
		File = { 
			"/BGAnimations/Resources/5th/Backgrounds/CABC.png",
			"/BGAnimations/Resources/5th/Backgrounds/CABC2.png"
		}
	},

	{
		Index = 1,
		Remove = true
	}

}

	BGA_ParamsTweaks( params, replace )

	t[#t+1] = LoadActor( "../5th001A", params )..{}


	params = {

		Index = 3,
		ID = 2,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DA 4x3.png",
		Frame_i = 5,
		X_num = { -4, 3 },
		Y_num = 1,
		Commands = "ZWrite"

	}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

	BGA_PostSpawn( t, params, replace )


	params = {

		Index = 4,
		ID = 3,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DA 4x3.png",
		Frame_i = 4,
		X_num = { -4, 3 },
		Y_num = { -1, 2 },
		Y_coord = 1,
		Commands = { "ZTest", "Move" }

	}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

	BGA_PostSpawn( t, params, replace )


return Def.ActorFrame{ t }
