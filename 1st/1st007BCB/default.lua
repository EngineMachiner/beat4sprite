
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D2.png",
		X_num = 1,
		Y_num = { -1, 0 },
		Zoom = 0.5,
		Delay = 4,
		Commands = { "Color", "Move" },
		Color = Color.Purple,
		X_coord = -1,
		ScrollSpeed = 0.625
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Backgrounds/B.png",
		X_num = 1,
		Commands = { "Color", "Mirror" },
		BGMirror = true,
		Color = color("0,0,1,1"),
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

return Def.ActorFrame{ t }