
local replace = ...
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		Frame_i = 7,
		Frame_l = 8,
		Cleanup = true,
		Commands = "StairsStates",
		X_num = { -4, 3 },
		Y_num = 1 
	},

	{
		Index = 2,
		Remove = true
	}

}

if replace then BGA_G.ParTweak(params, replace) end

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{}

}