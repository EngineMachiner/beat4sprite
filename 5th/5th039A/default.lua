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
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }