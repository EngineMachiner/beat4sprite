
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/H.png",
		X_num = 1,
		Commands = "Mirror",
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/M 7x1.png",
		Frame_i = 7,
		Zoom = 0.25,
		Script = "../Resources/Scripts/1st/SpiralStaticTrace.lua",
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )..{}

return Def.ActorFrame{ t }