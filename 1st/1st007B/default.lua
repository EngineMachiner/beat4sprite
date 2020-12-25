
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D.png",
		X_num = 1,
		Y_num = { -1, 0 },
		Zoom = 0.5,
		Delay = 8,
		Commands = { "Move", "Blend" },
		Blend = "BlendMode_Add",
		X_coord = -1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x3.png",
		Zoom = 1 - 0.25,
		X_num = 4,
		Y_num = { -2, 1 },
		Frame_i = 5
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )

return Def.ActorFrame{ t }