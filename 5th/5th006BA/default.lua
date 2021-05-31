
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		Y_coord = 1,
		FrmDelay = 2,
		Commands = { "StairsStates", "Move" },
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( tweaks, replace )
	t[#t+1] = loadfile( "/BGAnimations/5th006A/default.lua" )( tweaks )

return Def.ActorFrame{ t }