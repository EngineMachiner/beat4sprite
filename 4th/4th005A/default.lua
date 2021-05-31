
local args = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = "/BGAnimations/Resources/4th/Sprites/ABCDE 5x4.png",
		X_num = 4,
		Y_num = { -2, 1 },
		Frames = { 5, 20 }
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/Gradients/B 5x6.png",
		X_num = 4,
		Y_num = { 0, 1 },
		Zoom = 1.575,
		Y_pos = 0.575 * 0.7 * 1.485,
		Spacing = { 1, 2 },
		Frames = { 1, 30 },
		Fade = { 0.5, 0 },
		FadePeriodBy = 0.5,
		Blend = "BlendMode_Add",
		Color = "Rainbow",
		Commands = { "Mirror", "Fade" }
	}

}

params[3] = {}
DeepCopy( params[2], params[3] )
params[3]["Index"] = 3
params[3]["Fade"] = { -0.5, 0 }
params[3]["Y_pos"] = - 0.575 * 0.7

	BGA_G.ParTweak( params, args )
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }