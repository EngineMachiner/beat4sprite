
local replace = ...
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 6,
		X_num = 5,
		Y_num = { -2, 1 },
		Commands = "",
		BGMirror = false
	},

	{
		Index = 2
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th017AA/default.lua" )( params )

}