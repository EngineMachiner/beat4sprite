
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Videos/1stAB.mpg",
		X_num = 1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x3.png",
		Frame_i = 3,
		Zoom = 0.73,
		Dir = "Out",
		NoRot = true,
		Commands = "Color",
		Color = color("0,0,1,1"),
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/SpiralTrace.lua"
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )

return Def.ActorFrame{ t }