
local replace = ...

local params = {

	{ 
		Index = 2, 
		File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
		Cleanup = true,
		Frame_i = 1,
		Commands = "Mirror",
		BGMirror = true,
		X_num = 1
	},

	{
		Index = 1, 
		File = "/BGAnimations/Resources/5th/Sprites/CA 4x3.png",
		Frame_i = 8,
		Cleanup = true,
		X_num = { -4, 3 },
		Y_num = 1,
		Commands = "SpinY"
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	LoadActor( "../5th051A", params )..{}
}