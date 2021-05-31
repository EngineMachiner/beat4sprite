
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DAB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 16,
		Frame_l = 13,
		HurryTweenBy = 2,
		Cleanup = true
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