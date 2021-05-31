
local args = ...

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/4th/Sprites/Gradients/A001 8x8.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_i = 60,
		Frame_l = 1,
		Zoom = 4,
		FrmDelay = 4,
		Commands = "Mirror"
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = { 2, 15 },
		X_num = 4,
		Y_num = 2,
		Cut = 1,
		Blend = "BlendMode_Add",
		TCV = { 0, -1 },
		Commands = "StairsStates"
	}

}

BGA_G.ParTweak( params, args )
BGA_G.Tile(t,params)

return Def.ActorFrame{ t }