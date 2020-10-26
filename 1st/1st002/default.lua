
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x3.png",
		X_num = 4,
		Y_num = { -2, 1 },
		Zoom = 1 - 0.25,
		Frame_i = 4

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/M 6x1.png",
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/Stairs.lua",
		Zoom = 0.27,
		Commands = "FramePerSprite",
		Frame_l = 6
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )

return Def.ActorFrame{ t }