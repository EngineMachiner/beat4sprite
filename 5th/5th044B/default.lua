
local tweaks = ...

local params = {

	{ Index = 1 },

	{
		Index = 2,
		Remove = true
	}

}

local s = "/BGAnimations/Resources"
local params_2 = {

	Index = 1,
	File = s .. "/5th/Sprites/CAB 5x4.png",
	Frame_i = 11,
	Frame_l = 15,
	Dir = "Up"

}

	BGA_G.ParTweak( params, tweaks )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th044A/default.lua" )( params ),
	loadfile( s .. "/Scripts/Particles.lua" )( params_2 )
}