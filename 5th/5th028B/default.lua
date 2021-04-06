
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 5,
		X_num = { -4, 3 },
		Y_num = 2,
		Commands = { "Rainbow", "Move" },
		Y_coord = -1,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 11,
	Frame_l = 12,
	Commands = "TwoSprites",
	Rotation = true,
	Script = "../Resources/Scripts/SpiralStaticTrace.lua"
	
}

	BGA_G.ParTweak(params_2,replace)
	BGA_G.ParTweak(params,replace)

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor(params_2.Script,params_2)..{}

}

return Def.ActorFrame{ t }