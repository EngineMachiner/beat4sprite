
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 13,
		Commands = { "Move" },
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}
	

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("../Resources/Scripts/LineXY.lua",params_2)..{}

}