
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 13,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 10
}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("../Resources/5th/Scripts/WallBumps.lua",params_2)..{}

}