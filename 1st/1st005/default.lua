
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/HSV/A 4x1.png",
		X_num = 1,
		Frame_i = 4,
		Frame_l = 1,
		Delay = 8,
		NoDelayTweaking = true
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/Clock 6x5.png",
		X_num = 1,
		Commands = "ZWrite",
		Frame_i = 1,
		Frame_l = 30,
		Zoom = 5,
		Delay = 2,
		NoDelayTweaking = true
	},

	{ Index = 3	}

}

	BGA_G.Tile( t, params[1] )
	DeepCopy(params[1], params[3])
	params[3]["Delay"] = 8
	params[3]["Animate"] = true
	params[3]["State"] = 1
	params[3]["Commands"] = { "FramePerSprite", "ZTest" }
	params[3]["Frame_i"] = 4
	params[3]["Frame_l"] = 1
	BGA_G.Tile( t, params[2] )
	BGA_G.Tile( t, params[3] )

return Def.ActorFrame{ t }