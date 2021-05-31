
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
		File = "/BGAnimations/Resources/1st/Sprites/M 5x4.png",
		Frame_i = 3,
		Default = 20,
		Script = "/BGAnimations/Resources/Scripts/SpiralStaticTrace.lua",
	}

} 

	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( params[2]["Script"])( params[2] )..{}

return Def.ActorFrame{ t }