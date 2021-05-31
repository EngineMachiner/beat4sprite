
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		Remove = true
	},

	{
		Index = 2,
		File = {
					"/BGAnimations/Resources/5th/Backgrounds/ABC2.png",
					"/BGAnimations/Resources/5th/Backgrounds/ABC.png"
				},
		X_num = 1,
		Y_coord = -1,
		Commands = "Move",
		Cleanup = true
	}

}

	BGA_G.ParTweak( tweaks, replace )
	
	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )

return Def.ActorFrame{ t }