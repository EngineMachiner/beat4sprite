local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DAB 4x4.png",
		Frame_i = 9,
		Frame_l = 12,
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}
	
	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A", params)..{}

}