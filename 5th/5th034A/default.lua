
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/D.png",
		X_num = { -1, 2 },
		X_coord = -1,
		Delay = 3,
		Commands = "Move",
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( tweaks, replace )
	
	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )

return Def.ActorFrame{ t }