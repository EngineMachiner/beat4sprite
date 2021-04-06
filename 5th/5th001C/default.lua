
local t = Def.ActorFrame{}

local replace = ...
local tweaks = {

	Index = 1, -- The table with index to tweak.
	File = "/BGAnimations/Resources/5th/Backgrounds/BABC 2x2.png",
	Commands = { "Mirror" },
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_i = 2,
	Cleanup = true -- Deletes all the previous params values, false will keep the last defined params values.
}

	BGA_G.ParTweak( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }