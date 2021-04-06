
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/SkullR2 5x6.png",
		X_num = 2,
		Zoom = 2,
		Y_num = 1,
		Frame_l = 30,
		Blend = "BlendMode_Add",
		Commands = "Blend"
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/E 4x1.png",
		X_num = 1,
		Frame_l = 4,
		Delay = 0.25,
		BGMirror = true,
		Commands = { "Mirror" }
	}

} 

	BGA_G.Tile( t, params[2] )
	BGA_G.Tile( t, params[1] )

return Def.ActorFrame{ t }