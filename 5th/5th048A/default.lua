
local replace = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 2,
		File = { 
			"/BGAnimations/Resources/5th/Backgrounds/CABC2.png",
			"/BGAnimations/Resources/5th/Backgrounds/CABC.png"
		}
	},

	{
		Index = 1,
		Remove = true
	}

}

	BGA_G.ParTweak( params, replace )

	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( params )


	params = {

		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DA 4x3.png",
		Frame_i = 5,
		X_num = { -4, 3 },
		Y_num = 1,
		Commands = "ZWrite"

	}

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )


	params = {

		Index = 4,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DA 4x3.png",
		Frame_i = 4,
		X_num = { -4, 3 },
		Y_num = { -1, 2 },
		Y_coord = 1,
		Commands = { "ZTest", "Move" }

	}

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )


return Def.ActorFrame{ t }
