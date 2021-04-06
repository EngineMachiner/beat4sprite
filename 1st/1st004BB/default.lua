
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/1stAfro 3x5.png",
		X_num = 1,
		Y_num = { -2, 0 },
		Frame_l = 15,
		Commands = "Mirror",
		Zoom = 2.5,
		BGMirror = true
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/K 1x2.png",
		X_num = 1,
		Y_num = 1,
		Spacing = { 1.46, 1.46 },
		Frame_l = 2,
		Zoom = 0.375
	}

} 

	BGA_G.Tile( t, params[1] )
	BGA_G.Tile( t, params[2] )

return Def.ActorFrame{ t }