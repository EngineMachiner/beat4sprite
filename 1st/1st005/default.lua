
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/HSV/A 4x1.png",
		X_num = 1,
		Frame_i = 4,
		Frame_l = 1,
		Delay = 4,
		NoBPMDelay = true
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/Clock 6x5.png",
		X_num = 1,
		Commands = "ZWrite",
		Delay = 4/30,
		Frame_i = 1,
		Frame_l = 30,
		Zoom = 5,
		NoBPMDelay = true
	},

	{	Index = 3	}

}

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	local r = {}
	DeepCopy(params[1], params[3])
	params[3]["Delay"] = 4
	params[3]["InitState"] = 2
	params[3]["Commands"] = { "OffsetStates", "ZTest" }
	params[3]["Frame_i"] = 4
	params[3]["Frame_l"] = 1
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[3] )

return Def.ActorFrame{ t }