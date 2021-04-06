
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/J 3x5.png",
		X_num = 1,
		Spacing = { 1, 0.65 },
		Y_num = 1,
		Zoom = 2.5,
		Frame_l = 15,
		Color = Color.Orange,
		Blend = "BlendMode_Add",
		Commands = { "Color", "Blend" }
	},

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/E.png",
		Commands = "Mirror",
		BGMirror = true,
		X_num = 1
	}

} 

	BGA_G.Tile( t, params[2] )
	BGA_G.Tile( t, params[1] )

return Def.ActorFrame{ t }