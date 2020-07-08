local replace = ...

local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 7,
		Frame_l = 8,
		Delay = 1,
		Commands = "StairsStates",
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_ParamsTweaks( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }