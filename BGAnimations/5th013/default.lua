
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 8,
		ResetParams = true,
		X_num = 5,
		Y_num = { -2, 1 } 
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 1,
	Commands = "RandomState"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor("../Resources/Scripts/BumpY",params_2)..{}

}