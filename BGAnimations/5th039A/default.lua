local replace = ...

local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Y_coord = -1,
		Frame_i = 12,
		Delay = 2,
		Commands = "Move",
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