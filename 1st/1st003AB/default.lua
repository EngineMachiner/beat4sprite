
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/1stA 5x3.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_l = 15,
		Zoom = 1.5,
		Commands = { "Mirror" }
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/Stairs.lua",
		Flat = true,
		Dir = "Out",
		fov = 175,
		Add = 5,
		Commands = { "FramePerSprite" },
		ZoomX = 0.5,
		Frame_i = 2
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )

return Def.ActorFrame{ t }