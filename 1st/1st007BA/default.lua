
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D2.png",
		X_num = { 0, 1 },
		Y_num = { -1, 0 },
		Zoom = 0.5,
		Fade = { 0, 2 },
		Commands = "Fade",
		Color = Color.White,
		Color2 = Color.Red

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Frame_i = 2,
		Script = "/BGAnimations/Resources/Scripts/WallBumps.lua",
	}

} 

	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( params[2]["Script"])( params[2] )..{}

return Def.ActorFrame{ t }