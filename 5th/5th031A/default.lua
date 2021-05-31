
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		Commands = "StairsStates",
		RandomInitState = false
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th001A/default.lua" )( params )

}