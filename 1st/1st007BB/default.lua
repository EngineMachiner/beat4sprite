
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D2.png",
		X_num = 1,
		Y_num = { -1, 0 },
		Zoom = 0.5,
		Delay = 8,
		Commands = "Move",
		X_coord = -1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/L 6x1.png",
		Zoom = 0.25,
		X_pos = -0.58,
		X_num = { -2, 3 },
		Y_num = 1,
		Frame_l = 6,
		Commands = { "Blend", "FramePerSprite", "Zoomin" },
		Blend = "BlendMode_Add",
		Spacing = { 0.625, 1 }
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

return Def.ActorFrame{ t }