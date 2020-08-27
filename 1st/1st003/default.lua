
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Videos/1stA.mpg",
		X_num = 1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x3.png",
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/Stairs.lua",
		Zoom = 0.27,
		Flat = true,
		Dir = "Out",
		fov = 175,
		Add = 5,
		Commands = "FramePerSprite",
		Frame_i = 14,
		Frame_l = 15
	}

} 

	BGA_TileTool( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )

return Def.ActorFrame{ t }