
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/1stAB 5x3.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_l = 15,
		Zoom = 1.5,
		Commands = { "Mirror" }
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Frame_i = 16,
		Dir = "Out",
		Zoom = 0.93,
		Commands = "Color",
		NoRot = true,
		Color = color("0,0,1,1"),
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/SpiralTrace.lua"
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )

return Def.ActorFrame{ t }