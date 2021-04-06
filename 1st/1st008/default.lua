
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
		Zoom = 0.25,
		Frame_i = 3,
		Script = "../Resources/Scripts/SpiralStaticTrace.lua",
	}

} 

	BGA_G.Tile( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )..{}

return Def.ActorFrame{ t }