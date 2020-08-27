
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/I 4x4.png",
		X_num = 2,
		Zoom = 1.07,
		Y_num = { -2, 1 },
		Frame_l = 16,
		Delay = 0.125,
		Commands = { "Color", "MirrorYPerRow" },
		Color = color("#00FF00")
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/HSV/B 4x1.png",
		X_num = 1,
		Frame_l = 4,
		Delay = 0.125,
		BGMirror = true,
		Commands = { "Mirror" }
	}

} 

	BGA_TileTool( t, params[1] )
	BGA_TileTool( t, params[2] )

return Def.ActorFrame{ t }