
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/J 6x5.png",
		X_num = 1,
		Spacing = { 1, 0.65 },
		Y_num = 1,
		Zoom = 2.5,
		Frame_l = 30,
		Color = Color.Orange,
		Commands = { "Color" }
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/SkullR 5x6.png",
		X_num = { -3, 2 },	
		Y_num = 1,
		Zoom = 2,
		Frame_l = 30,
		Delay = 4/30,
		Commands = "Blend",
		Blend = "BlendMode_Add"
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

return Def.ActorFrame{ t }