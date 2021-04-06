
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D.png",
		X_num = { 0, 1 },
		Y_num = { -1, 0 },
		X_pos = 0.75,
		Zoom = 0.5,
		HurryTweenBy = 2,
		Commands = { "Move", "Blend" },
		Blend = "BlendMode_Add",
		X_coord = -1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Zoom = 1,
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 5
	}

} 

	BGA_G.Tile( t, params[2] )
	BGA_G.Tile( t, params[1] )

return Def.ActorFrame{ t }