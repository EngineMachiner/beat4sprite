local replace = ...

local tweaks = {

	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		Frame_i = 9,
		Frame_l = 10,
		X_num = { -4, 3 },
		Y_num = 1,
		Commands = "StairsStates",
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_ParamsTweaks( tweaks, replace )

return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th001A", tweaks )..{}

}