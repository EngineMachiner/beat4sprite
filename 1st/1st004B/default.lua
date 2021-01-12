
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/1stAfro 6x5.png",
		X_num = 1,
		Y_num = { -2, 0 },
		Y_pos = 1,
		Frame_l = 30,
		Delay = 2/30,
		Commands = "Mirror",
		Zoom = 2.5,
		BGMirror = true
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/HSV/B 4x1.png",
		X_num = 1,
		Frame_l = 4,
		Delay = 0.125,
		BGMirror = true,
		Commands = { "Mirror", "Rainbow" }
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

return Def.ActorFrame{ t }